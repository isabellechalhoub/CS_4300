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
persistent x_loc;
persistent y_loc;
persistent direc;
persistent board;

goal_state = [1,1,2];

% Our initial state is 0 because we haven't found the gold yet.
if isempty(state)
    state = 0;
    x_loc = 1;
    y_loc = 1;
    direc = 0;
    board = ones(4,4);
    board(translation(x_loc), translation(y_loc)) = 0;
end

switch state
    % In our initial state, we just randomly look for gold.
    case 0
        action = ceil((3)*rand(1));
        
        % Since we have safely traveled to this new location, it is safe.
        board(translation(x_loc), translation(y_loc)) = 0;
        
        % Now we need to update our location with the action we have
        % chosen.
        res = update_location(action, x_loc, y_loc, direc);
        x_loc = res.new_x;
        y_loc = res.new_y;
        direc = res.new_direc;
        
        % Check if we are at the gold
        if percept(2) == 1
            initial_state = [x_loc, y_loc, direc];
            board(translation(x_loc), translation(y_loc)) = 2;
            [so, no] = CS4300_Wumpus_A_star(board, initial_state, goal_state, h_name);
            state = 1;
        end
                
    % Our other state is if we have found the gold and need to go home
    case 1
        
end

% Second:
%   Once it finds it: uses A* search to find an optimal sequence of actions
%   to move from the gold location back to the start location (this means 
%   keeping track of known clear cells in the board)


% Third:
%   Prepares an escape action sequence that starts with GRAB


% Fourth:
%   Uses move actions to get back to the start


% Fifth:
%   Finishes the sequence with Climb


end

