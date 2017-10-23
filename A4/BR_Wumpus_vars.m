function vars = BR_Wumpus_vars(KB)
% BR_Wumpus_vars - find list of variables in logical sentences
% On input:
%     KB (nx1 conjunctive normal form vector): conjunctive clauses
%       (i).clauses (1xm vector): disjunctive clause
% On output:
%     vars (1xp vector struct): list of variables in KB
%       (k).var (string): Wumpus variable name (e.g., P23: Pit in [2,3])
% Call:
%     vars = BR_Wumpus_vars(KB);
% Author:
%     T. Henderson
%     UU
%     Summer 2017
%

BLANK = ' ';

num_vars = 0;
vars = [];

for s = 1:length(KB)
    clause = [KB(s).clauses,BLANK];
    len_clause = length(clause);
    index = 1;
    while index<len_clause
        [v,index] = BR_get_next_var(clause,index,len_clause);
        vars = BR_insert_var_sorted(vars,v);
    end
end
