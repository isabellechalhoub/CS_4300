function p = CS4300_P_Wumpus(i,a,j,b)
% CS4300_P_Wumpus - predicate for Wumpus World
%    i and j are distinct nodes; a,b in {C,P,B}
% On input:
%     i (int): a node
%     a (int): label for node i
%     j (int): a node (distinct from i)
%     b (int): label for node j
% On output:
%     p (Boolean): 1 if predicate true; else 0
% Call:
%     p = CS4300_P_Wumpus(1,1,2,2);
% Author:
%     T. Henderson
%     UU
%     Fall 2017
%

% Col 1: Clear;  Col 2: Pit; Col 3: Breeze

truths = [1,0,1; 0,1,1; 1,1,0];

p = truths(a,b);