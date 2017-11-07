function [ board ] = CS4300_gen_wumpus_board()
% CS4300_gen_wumpus_board - generate a Wumpus board with only the Wumpus
% On output:
%     board (4x4 int array): Wumpus board
%       0: nothing in room
%       1: wumpus in room
% Call:
%     b = CS4300_gen_board();
% Author:
%     Isabelle Chalhoub   Karla Kraiss
%     UU
%     Summer 2015
%

translation = [1,1; 1,2; 1,3; 1,4;
               2,1; 2,2; 2,3; 2,4;
               3,1; 3,2; 3,3; 3,4;
               4,2; 4,3; 4,4;];
% pick a random place to put the wumpus besides the starting location
location = ceil((15)*rand(1));

board = zeros(4,4);

x = translation(location,1);
y = translation(location,2);

board(x,y) = 1;
end

