function coords = translation( x, y )
%TRANSLATION takes in the x/y coordinates as we know them
%   and converts them to the correct coordinates to access a 4x4 array
%   of the board.

coords.y = 4 - y + 1;
coords.x = x;
    
end

