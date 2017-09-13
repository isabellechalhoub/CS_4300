function distance = CS4300_heuristic( x1, y1, x2, y2 )
%CS4300_heuristic calculates the manhattan distance between from the
%   currentlocation (x2,y2) to the goal location (x1,y2)
% On input:
%   (x1,y1) - The x and y coordinates of the goal cell
%   (x2,y2) - the x and y coordinates of the current cell
% On output:
%   The manhattan distance from the current cell to the goal
% Call:
%   d = CS4300_heuristic(goal_x, goal_y, current_x, current_y);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017%

distance = abs(x1-x2) + abs(y1-y2);

end

