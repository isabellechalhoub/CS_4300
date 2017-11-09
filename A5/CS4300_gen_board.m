function board = CS4300_gen_board(p)
% CS4300_gen_board - generate a Wumpus board
% On input:
%     p (float): probability of pit in room
% On output:
%     board (4x4 int array): Wumpus board
%       0: nothing in room
%       1: pit in room
%       2: gold in room
%       3: Wupmus in room
%       4: both gold and Wumpus in room
% Call:
%     b = CS4300_gen_board(0.2);
% Author:
%     T. Henderson
%     UU
%     Summer 2015
%

PIT = 1;
GOLD = 2;
WUMPUS = 3;
BOTH = 4;

done = 0;
while done==0
    board = double(rand(4,4)<p);
    if sum(sum(board))<15
        done = 1;
    end
end
board(4,1) = 1;
[rows,cols] = find(~board);
board(4,1) = 0;
num_open = length(rows);
loc_g = randi(num_open);
loc_w = randi(num_open);
if loc_g==loc_w
    board(rows(loc_g),cols(loc_g)) = BOTH;
else
    board(rows(loc_g),cols(loc_g)) = GOLD;
    board(rows(loc_w),cols(loc_w)) = WUMPUS;
end
