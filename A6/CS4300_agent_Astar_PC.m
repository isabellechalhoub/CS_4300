function action = CS4300_agent_Astar_PC(percept)
% CS4300_agent_Astar_AC - A* search agent with AC 
%    Uses A* to find best path back to start and AC to avoid trouble
% On input:
%     percept (1x5 Boolean vector): percept values
%      (1): Stench
%      (2): Breeze
%      (3): Glitters
%      (4): Bumped
%      (5): Screamed
% On output:
%     action (int): action selected by agent
%       FORWARD = 1;
%       ROTATE_RIGHT = 2;
%       ROTATE_LEFT = 3;
%       GRAB = 4;
%       SHOOT = 5;
%       CLIMB = 6;
% Call:
%     a = CS4300_agent_Astar_AC([0,0,0,0,0]);
% Author:
%     T. Henderson
%     UU
%     Fall 2017
%

persistent board x y dir gold action_taken escape
persistent visited G D P indexes travel

FORWARD = 1;
ROTATE_RIGHT = 2;
ROTATE_LEFT = 3;
GRAB = 4;
SHOOT = 5;
CLIMB = 6;

if isempty(board)
    board = -ones(4,4);
    board(4,1) = 0;
    x = 1;
    y = 1;
    dir = 0;
    action_taken = 0;
    escape = [];
    G = zeros(4,4);
    G(1,2) = 1;
    G(1,5) = 1;
    G(2,1) = 1;
    G(2,3) = 1;
    G(2,6) = 1;
    G(3,2) = 1;
    G(3,4) = 1;
    G(3,7) = 1;
    G(4,3) = 1;
    G(4,8) = 1;
    G(5,1) = 1;
    G(5,6) = 1;
    G(5,9) = 1;
    G(6,2) = 1;
    G(6,5) = 1;
    G(6,7) = 1;
    G(6,10) = 1;
    G(7,3) = 1;
    G(7,6) = 1;
    G(7,8) = 1;
    G(7,11) = 1;
    G(8,4) = 1;
    G(8,7) = 1;
    G(8,12) = 1;
    G(9,5) = 1;
    G(9,10) = 1;
    G(9,13) = 1;
    G(10,6) = 1;
    G(10,9) = 1;
    G(10,11) = 1;
    G(10,14) = 1;
    G(11,7) = 1;
    G(11,10) = 1;
    G(11,12) = 1;
    G(11,15) = 1;
    G(12,8) = 1;
    G(12,11) = 1;
    G(12,16) = 1;
    G(13,9) = 1;
    G(13,14) = 1;
    G(14,10) = 1;
    G(14,13) = 1;
    G(14,15) = 1;
    G(15,11) = 1;
    G(15,14) = 1;
    G(15,16) = 1;
    G(16,12) = 1;
    G(16,15) = 1;
    
    D = ones(16,1);
    D = [D,2*ones(16,1)];
    D = [D,3*ones(16,1)];
    D(1,2) = 0;
    
    P = 'CS4300_P_Wumpus';
    
    indexes = zeros(4,4);
    indexes(1,1) = 1;
    indexes(2,1) = 2;
    indexes(3,1) = 3;
    indexes(4,1) = 4;
    indexes(1,2) = 5;
    indexes(2,2) = 6;
    indexes(3,2) = 7;
    indexes(4,2) = 8;
    indexes(1,3) = 9;
    indexes(2,3) = 10;
    indexes(3,3) = 11;
    indexes(4,3) = 12;
    indexes(1,4) = 13;
    indexes(2,4) = 14;
    indexes(3,4) = 15;
    indexes(4,4) = 16;
    visited = zeros(4,4);
    travel = [];
end

[x,y,dir] = CS4300_act(x,y,dir,action_taken);
row = 4 - y + 1;
col = x;
visited(row,col) = 1;
board(row,col) = 0;

if ~isempty(escape)   % pre-planned escape sequence of actions
    action = escape(1);
    escape = escape(2:end);
    action_taken = action;
    return
end

if ~isempty(travel)
    action = travel(1);
    travel = travel(2:end);
    action_taken = action;
    return
end

if percept(3)==1
    row = 4 - y + 1;
    col = x;
    board(row,col) = 0;
    [sol,nodes] = CS4300_Wumpus_A_star(abs(board),[x,y,dir],[1,1,0],...
        'CS4300_A_star_Man');
    sol = [x,y,dir,GRAB;sol(2:end,:);1,1,1,CLIMB];
    escape = sol(:,end);
    action = escape(1);
    escape = escape(2:end);
    action_taken = action;
    return
end

if percept(2)==0
    if x+1<5
        index = indexes(x+1,y);
        D(index,2) = 0;
    end
    if x-1>0
        index = indexes(x-1,y);
        D(index,2) = 0;
    end
    if y+1<5
        index = indexes(x,y+1);
        D(index,2) = 0;
    end
    if y-1>0
        index = indexes(x,y-1);
        D(index,2) = 0;
    end
    index = indexes(x,y);
    D(index,3) = 0;
end
D = CS4300_PC(G,D,P);
rows = find(D(:,2)==0);
if ~isempty(rows)
    num_rows = length(rows);
    for r = 1:num_rows
        [xx,yy] = find(indexes==rows(r));
        row = 4 - yy + 1;
        col = xx;
        board(row,col) = 0;
    end
end
[rows,cols] = find(board==0&visited==0);
if ~isempty(rows)
    [sol,nodes] = CS4300_Wumpus_A_star(abs(board),[x,y,dir],...
        [cols(1),4-rows(1)+1,0],'CS4300_A_star_Man');
    travel = sol(2:end,4);
    action = travel(1);
    travel = travel(2:end);
    action_taken = action;
    return
end
action = randi(3);
action_taken = action;