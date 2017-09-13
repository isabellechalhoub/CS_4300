function r = CS4300_board_translation( y )
%CS4300_board_translation takes in the y coordinate as we know it
%   and converts it to the correct coordinates to access a 4x4 array
%   of the board.
% On input:
%   The y coordinate as we know it in wumpus world
% On output:
%   The translated row value for indexing into a matrix in matlab
% Call:
%   r = CS4300_A2_driver(y);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017%

r = 4 - y + 1;

end

