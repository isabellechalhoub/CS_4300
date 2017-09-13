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
% R is a restraint function

% First:
%   uses percepts to delete labels appropriately

Be brave unless there is a breeze. (random choice)
If there is a known safe cell - go there, if multiple, pick random
If only breezes, pick random
Once we know where the gold is - A-star home

% Second:
%   uses AC to update D
% Third:
%   determines if a safe cell exists that has not been visited, and if so 
%   uses A* to plan a travel action sequence to get there, otherwise 
%   randomly chooses from {Forward, Right, Left}
% Fourth:
%   if it is in the cell with gold, then it creates an escape action 
%   sequence; e.g., [GRAB,<move to [1,1]>,CLIMB]

end

