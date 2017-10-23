function KB_out = BR_gen_ad_hoc(KB)
% BR_gen_ad_hoc - generate ad hoc logic in KB
% On input:
%     KB (CNF KB): knowledge base
% On output:
%     KB_out (CNF KB): KB with ad hoc logic
% Call:
%     KB = BR_gen_ad_hoc(KB);
% Author:
%     T. Henderson
%     UU
%     Summer 2017
%

KB_out = KB;

if isempty(KB)
    num_clauses = 0;
else
    num_clauses = length(KB);
end

num_clauses = num_clauses + 1;
KB_out(num_clauses).clauses = ...
    ['G11 G21 G31 G41 G12 G22 G32 G42 G13 G23 G33 G43 G14 G24 G34 G44'];
num_clauses = num_clauses + 1;
KB_out(num_clauses).clauses = ...
    ['W11 W21 W31 W41 W12 W22 W32 W42 W13 W23 W33 W43 W14 W24 W34 W44'];
%num_clauses = num_clauses + 1;
%KB_out(num_clauses).clauses = ['-P11'];
%num_clauses = num_clauses + 1;
%KB_out(num_clauses).clauses = ['-W11'];
%num_clauses = num_clauses + 1;
%KB_out(num_clauses).clauses = ['-G11'];
