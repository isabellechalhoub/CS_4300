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
%   Fall 2017
%

% First:
%   Randomly uses Forward, Right, & Left to find the gold.
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

