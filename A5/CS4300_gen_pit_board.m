function board = CS4300_gen_pit_board(p)
% CS4300_gen_pit_board - generate a Wumpus board with only pits
% On input:
%     p (float): probability of pit in room
% On output:
%     board (4x4 int array): Wumpus board
%       0: nothing in room
%       1: pit in room
% Call:
%     b = CS4300_gen_pit_board(0.2);
% Author:
%     T. Henderson  Isabelle Chalhoub   Karla Kraiss
%     UU
%     Summer 2015
%

done = 0;
while done==0
    board = double(rand(4,4)<p);
    if sum(sum(board))<15
        done = 1;
    end
end
board(4,1) = 0;
