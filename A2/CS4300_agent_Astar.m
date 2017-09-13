function action = CS4300_agent_Astar(percept)
% CS4300_agent_Astar - A* search agent example
%   Uses A* to find best path back to start
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
%   a = CS4300_agent_Astar([0,0,0,0,0]);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017%

% We need to keep track of our state so that when we are going back to the
% start, we know which step we are on.
persistent state;
persistent agent_state;
persistent board;
persistent step;
persistent so;

goal_state = [1,1,2];
GRAB = 4;
CLIMB = 6;

% Our initial state is 0 because we haven't found the gold yet.
if isempty(state)
    state = 0;
    agent_state(1) = 1;
    agent_state(2) = 1;
    agent_state(3) = 0;
    board = ones(4,4);
    board(CS4300_board_translation(agent_state(1)), agent_state(2)) = 0;
    step = 1;
end

switch state
    % In our initial state, we just randomly look for gold.
    case 0
        action = ceil((3)*rand(1));
        
        % Since we have safely traveled to this new location, it is safe.
        
        % Now we need to update our location with the action we have
        % chosen.
        res = CS4300_Wumpus_transition(agent_state, action, board);
        if res(1) == -1 && res(2) == -1 && res(3) == -1
            board(agent_state(1), agent_state(2)) = 1;
            return;
        end
        agent_state(1) = res(1);
        agent_state(2) = res(2);
        agent_state(3) = res(3);
        board(CS4300_board_translation(agent_state(1)), agent_state(2)) = 0;
        
        % Check if we are at the gold
        if percept(3)
            initial_state = [agent_state(1), agent_state(2), agent_state(3)];
            board(CS4300_board_translation(agent_state(1)), agent_state(2)) = 2;
            [so, no] = CS4300_Wumpus_A_star(board, initial_state, goal_state, 'CS4300_heuristic');
            state = 1;
        end
                
    % Our other state is if we have found the gold and need to go home
    case 1
        if step == 1
            action = GRAB;
        else
            if step <= size(so, 1)
                action = so(step, 4);
            else
                action = CLIMB;
            end
        end
        step = step + 1;
end

end

