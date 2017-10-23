function [ score, trace ] = CS4300_A4_driver(board_num,steps)
%CS4300_A4_DRIVER Summary of this function goes here
%   Detailed explanation goes here

board1 = [0,0,0,3;0,0,0,0;2,1,0,0;0,0,0,0];
board2 = [0,0,0,1;3,2,1,0;0,0,0,0;0,0,1,0];
board3 = [0,0,0,0;0,0,0,0;3,2,0,0;0,1,0,0];

switch board_num
    case 1
        board = board1;
    case 2
        board = board2;
    case 3
        board = board3;
end

[score, trace] = CS4300_WW1(steps, 'CS4300_hybrid_agent0',board);

end

