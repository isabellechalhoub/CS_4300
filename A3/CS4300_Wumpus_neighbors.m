function [ neis ] = CS4300_Wumpus_neighbors( x, y )

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
