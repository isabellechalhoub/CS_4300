function action = CS4300_hybrid_agent0(percept)
% CS4300_hybrid_agent0 - hybrid agent with a few informal rules
% On input:
%     percept (1x5 Boolean vector): percept from Wumpus world
%       (1): stench
%       (2): breeze
%       (3): glitter
%       (4): bump
%       (5): scream
% On output:
%     action (int): action to take
%       1: FORWARD
%       2: RIGHT
%       3: LEFT
%       4: GRAB
%       5: SHOOT
%       6: CLIMB
% Call:
%     a = CS4300_hybrid_agent0(percept);
% Author:
%     T. Henderson
%     UU
%     Fall 2015
%

persistent t plan board agent safe visited have_gold pits Wumpus have_arrow KBi wumpus_loc;

if isempty(t)
    t = 0;
    plan = [];
    board = [-1,-1,-1,-1; -1,-1,-1,-1;-1,-1,-1,-1;0,-1,-1,-1];
    pits = -ones(4,4);
    pits(4,1) = 0;
    Wumpus = -ones(4,4);
    Wumpus(4,1) = 0;
    agent.x = 1;
    agent.y = 1;
    agent.dir = 0;
    visited = zeros(4,4);
    visited(4,1) = 1;
    safe = zeros(4,4);
    safe(4,1) = 1;
    have_gold = 0;
    have_arrow = 1;
    [KB, KBi, vars] = BR_gen_KB();
    wumpus_loc = [-1,-1];
end

translation = [0, 4, 8, 12;
               1, 5, 9, 13;
               2, 6, 10, 14;
               3, 7, 11, 15];

locations = [2,1;
             3,1;
             4,1;
             1,2;
             2,2;
             3,2;
             4,2;
             1,3;
             2,3;
             3,3;
             4,3;
             1,4;
             2,4;
             3,4;
             4,4];

MINUS = '-';

FORWARD = 1;
RIGHT = 2;
LEFT = 3;
GRAB = 4;
SHOOT = 5;
CLIMB = 6;

if have_gold == 0
    sentence = CS4300_make_percept_sentence(percept, agent.x, agent.y);

    for i=1:3
        KBi = CS4300_Tell(KBi, sentence(i));
    end

    % Tell the KB there is no pit where we are
    clause.clauses = -1*(translation(agent.x,agent.y) + 33);
    KBi = CS4300_Tell(KBi, clause);

    % Tell the KB there is no wumpus where we are
    clause.clauses = -1*(translation(agent.x,agent.y) + 65);
    KBi = CS4300_Tell(KBi, clause);

    % Ask about safe neighbors and update safe/board/KBi
    neighbors = CS4300_Wumpus_neighbors(agent.x,agent.y);
    num_neighbors = length(neighbors(:,1));
    for i=1:num_neighbors
        n_x = neighbors(i,1);
        n_y = neighbors(i,2);
        if (board(4-n_y+1,n_x) == -1)
            [a,thm1,thm2] = CS4300_find_safe_neighbor(KBi, [n_x, n_y]);

            if strcmp(a,'safe')
                safe(4-n_y+1,n_x) = 1;
                board(4-n_y+1,n_x) = 0;

    %             s.clauses = thm1;
    %             KBi = CS4300_Tell(KBi,s);
    %             s.clauses = thm2;
    %             KBi = CS4300_Tell(KBi,s);
            elseif strcmp(a,'pit')
                board(4-n_y+1,n_x) = 1;

    %             s.clauses = thm1;
    %             KBi = CS4300_Tell(KBi,s);
            elseif strcmp(a,'wumpus')
                board(4-n_y+1,n_x) = 3;

    %             s.clauses = thm1;
    %             KBi = CS4300_Tell(KBi,s);
                wumpus_loc = [n_x,n_y];
            end
        end
    end
end

if have_gold==0&percept(3)==1
    disp('gold plan');
    [so,no] = CS4300_Wumpus_A_star(board,[agent.x,agent.y,agent.dir],...
        [1,1,0],'CS4300_A_star_Man');
    plan = [GRAB;so(2:end,end);CLIMB];
end

if isempty(plan)
    disp('first plan');
    OK1 = CS4300_choose1(safe,visited);
    if ~isempty(OK1)
        [so,no] = CS4300_Wumpus_A_star(board,[agent.x,agent.y,agent.dir],...
            [OK1(1),OK1(2),0],'CS4300_A_star_Man');
        plan = [so(2:end,end)];
    end
end

if isempty(plan)
    disp('second plan');
    goal = [];
    neighbors = CS4300_Wumpus_neighbors(agent.x,agent.y);
    num_neighbors = length(neighbors(:,1));
    for n = 1:num_neighbors
        if board(4-neighbors(n,2)+1,neighbors(n,1))<0
            goal = neighbors(n,:);
        end
    end
    if isempty(goal)
        [rows,cols] = find(board==-1);
        if isempty(rows)
            goal = [1,1];
        else
            goal = [cols(1),4-rows(1)+1];
        end
    end
    [so,no] = CS4300_Wumpus_A_star(board,[agent.x,agent.y,agent.dir],...
        [goal,0],'CS4300_A_star_Man');
    plan = [so(2:end,end)];
end

if isempty(plan) && wumpus_loc(1) > 0
    x = 'found wumpus'
end

if isempty(plan)
    disp('default plan');
    [so,no] = CS4300_Wumpus_A_star(board,[agent.x,agent.y,agent.dir],...
        [1,1,0],'CS4300_A_star_Man');
    plan = [so(2:end,end)];
end

safe
board

action = plan(1);
plan = plan(2:end);

if action==FORWARD
    [x_new,y_new] = CS4300_move(agent.x,agent.y,agent.dir);
    agent.x = x_new;
    agent.y = y_new;
    visited(4-y_new+1,x_new) = 1;
    board(4-y_new+1,x_new) = 0;
end

if action==RIGHT
    agent.dir = rem(agent.dir+3,4);
end

if action==LEFT
    agent.dir = rem(agent.dir+1,4);
end

if action==GRAB
    have_gold = 1;
end
t = t + 1;