function d = CS4300_A_star_Man(state1,state2,board)
% CS4300_A_star_Man - computes Manhattan distance between two Wumpus states
% On input:
%     state1 (1x3 vector): x,y,dir of state 1
%     state2 (1x3 vector): x,y,dir of state 2
% On output:
%     d (int): Manhattan distance
% Call:
%     d = CS4300_A_star_Man([1,1,0],[2,2,1]);
% Author:
%     Isabelle Chalhoub Karla Kraiss
%     UU
%     Fall 2016
%

d = sum(abs(state1(1:2)-state2(1:2)));
if board(state2(1),state2(2)) == -1
    d = d + 1;
end
