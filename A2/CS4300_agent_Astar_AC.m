function action = CS4300_agent_Astar_AC(percept)
% CS4300_agent_Astar_AC - A* search agent with AC
%   Uses A* to find best path back to start and AC to avoid trouble
% On input:
%   percept (1x5 Boolean vector): percept values
%       (1): Stench
%       (2): Breeze
%       (3): Glitters
%       (4): Bumped
%       (5): Screamed
% On output:
%   action (int): action selected by agent
%       FORWARD = 1;
%       ROTATE_RIGHT = 2;
%       ROTATE_LEFT = 3;
%       GRAB = 4;
%       SHOOT = 5;
%       CLIMB = 6;
% Call:
%   a = CS4300_agent_Astar_AC([0,0,0,0,0]);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017
%

% G is the connectivity of the graph for WW cells
% D is the set of labels {C,P,B}
%   C = clear
%   P = pit
%   B = breeze
% P is the predicate (restraint function)

% First:
%   uses percepts to delete labels appropriately

persistent state;
persistent D;
persistent G;
persistent P;
persistent agent_state;
persistent translation_matrix;
persistent step;
persistent a_star_step;
persistent so;
persistent board;
persistent goal_state;
persistent cell_translation;

GRAB = 4;
CLIMB = 6;

if isempty(G)
    step = 2;
    a_star_step = 3;
    % We have 16 nodes for our 4x4 board
    
    G = [0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0;
         1,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0;
         0,1,0,1,0,0,1,0,0,0,0,0,0,0,0,0;
         0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0;
         1,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0;
         0,1,0,0,1,0,1,0,0,1,0,0,0,0,0,0;
         0,0,1,0,0,1,0,1,0,0,1,0,0,0,0,0;
         0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0;
         0,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0;
         0,0,0,0,0,1,0,0,1,0,1,0,0,1,0,0;
         0,0,0,0,0,0,1,0,0,1,0,1,0,0,1,0;
         0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1;
         0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0;
         0,0,0,0,0,0,0,0,0,1,0,0,1,0,1,0;
         0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,1;
         0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0];
    
     translation_matrix = [1,5,9,13;
                           2,6,10,14;
                           3,7,11,15;
                           4,8,12,16];
                       
    cell_translation = [1,1; 2,1; 3,1; 4,1;
                        1,2; 2,2; 3,2; 4,2;
                        1,3; 2,3; 3,3; 4,3;
                        1,4; 2,4; 3,4; 4,4;];
%                     
% 
%     translation_matrix = [13,14,15,16;
%                           9,10,11,12;
%                          5,6,7,8
%                          1,2,3,4];
    d_to_board = [4,1;4,2;4,3;4,4;
                        3,1;3,2;3,3;3,4;
                        2,1;2,2;2,3;2,4;
                        1,1;1,2;1,3;1,4];                  

    D = ones(16,3);
    P = 'CS4300_predicate'; % if you get clear you can't have a pit.
    agent_state = [1,1,0];
    state = 0;
    board = ones(4,4);
    agent_state(1) = 1;
    agent_state(2) = 1;
    agent_state(3) = 0;
    goal_state = [1,1,2];
    board(CS4300_board_translation(agent_state(2)), agent_state(1)) = 0;
end

switch state
    
    case 0
        node = translation_matrix(agent_state(1), agent_state(2));
        %set neighbors to no pit as well since we don't feel a breeze
        if percept(2) == 0
            for index=1:16
                if G(node, index) == 1
                    D(index, 2) = 0;
                    res = cell_translation(index,:);
                    board(res(1),res(2)) = 0;
                end
            end
            D(node, 2) = 0;
            D(node, 3) = 0;
            D = CS4300_AC3(G,D,P);
        
        elseif percept(2) == 1
            D(node, 1) = 0;
            D(node, 2) = 0;
        end
        
        goal_cell = CS4300_find_safe_cell(D, [agent_state(1),agent_state(2)]);
        
        %there is a real safe cell to go to
        if(goal_cell(1) ~= -1)
            initial_state = [agent_state(1), agent_state(2), agent_state(3)];
            [so, no] = CS4300_Wumpus_A_star(board, initial_state,...
                [goal_cell, 0], 'CS4300_heuristic');
            state = 2;
            action = so(2,4);
        %make an action
        else
            action = ceil((3)*rand(1));
        end
        
        agent_state = CS4300_Wumpus_transition(agent_state, action, board);
        board(CS4300_board_translation(agent_state(2)), agent_state(1)) = 0;
        
        if percept(3) == 1
            % We are on the gold! - Go home!!
            initial_state = [agent_state(1), agent_state(2), agent_state(3)];
            board(CS4300_board_translation(agent_state(2)), agent_state(1)) = 2;
            [so, no] = CS4300_Wumpus_A_star(board, initial_state, goal_state, 'CS4300_heuristic');
            state = 1;
            action = GRAB;
        end 

    case 1
        if step <= size(so, 1)
            action = so(step, 4);
        else
            action = CLIMB;
        end
        
        step = step + 1;
        
    case 2
        if a_star_step <= size(so, 1)
            action = so(a_star_step,4);
            if a_star_step == size(so,1)
                state = 0;
            end
        else
            action = 0;
            state = 0;
        end
end
% Now call AC3/revise to update D
% This will return a revised Di which we can use to make a good decision on
%   where to go

% STATE 1 - if we have a known safe cell, go there using A*
%           else - make a random choice from where you are

% STATE 2 - We are at the gold, use A* to go home

%  ARC CONSISTENCY 3
%
%   while queue is not empty, do:
%       (xi, xj) <- remove first arc from queue and it gives you 2 nodes 
%       if AC3(csp, xi, xj) is different than Di we passed then:
%           if size Di = 0, then 
%               see if there exists an unexplored safe cell - trace to this
%               otherwise - random pick
%           for each neighbor xk of the xi that we revised do:
%               add (xk,xi) to the queue (so we can double check it)
%   return true;

end

