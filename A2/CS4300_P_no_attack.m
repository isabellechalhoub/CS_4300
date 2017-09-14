function p = CS4300_P_no_attack(i,a,j,b)
% CS6100_P_no_attack - predicate for N-queens
%    i and j are distinct rows; a and b are columns
%    queens attack if thet are on the same column or diagonal
% On input:
%     i (int): a row node
%     a (int): column for queen on row i
%     j (int): a row node (distinct from i)
%     b (int): column for queen on row j
% On output:
%     p (Boolean): 1 if predicate true; else 0
% Call:
%     p = CS6100_P_no_attack(1,1,2,1);
% Author:
%     T. Henderson
%     UU
%     Spring 2015
%

p = 1;
if (a==b)||(abs(i-j)==abs(a-b))
    p = 0;
    return
end

