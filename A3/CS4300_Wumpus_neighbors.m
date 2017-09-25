function [ neis ] = CS4300_Wumpus_neighbors( x, y )
% CS4300_Wumpus_neighbors - generate neighboring cells given a cell's
%   coordinates
%   On input:
%       x : The x coordinate for the provided cell
%       y : The y coordinate for the provided cell
%   On output:
%       neis : a 2 x n matrix of neighboring cell coordinates
%           The (1) index holds the x coord and the (2) index holds the y
%           coord for the given neighboring cell. The n dimension is
%           between 2 and 4 and is dependent on whether the cell is an
%           edge, center, or corner cell.
%   Call:
%       neis = CS4300_Wumpus_neighbors(x,y);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017
%

neis = [];

% Center cells
if (x == 2 || x == 3) && (y == 2 || y == 3)
    neis = [x, y-1; x-1, y; x+1, y; x, y+1];
% Corner Cells
elseif (x == 1 || x == 4) && (y == 1 || y == 4)
    if x == 1 && y == 1
        neis = [2, 1; 1, 2];
    elseif x == 4 && y == 1
        neis = [3, 1; 4, 2];
    elseif x == 1 && y == 4
        neis = [1, 3; 2, 4];
    else
        neis = [4, 3; 3, 4];
    end
% Edge Cells
else
    if y == 1
        neis = [x-1, y; x+1, y; x, y+1];
    elseif y == 4
        neis = [x, y-1; x-1, y; x+1, y];
    elseif x == 1
        neis = [x, y-1; x+1, y; x, y+1];
    elseif x == 4
        neis = [x, y-1; x-1, y; x, y+1];
    end
end
