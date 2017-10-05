function b = CS4300_empty_clause(Ui)
% CS4300_empty_clause - determine if empty clause produced
% On input:
%     Ui (CNF data structure): array of conjuctive clauses
%       (i).clauses
%           each clause is a list of integers (- for negated literal)
% On output:
%     b (Boolean): 0 if empty clause not produced, else 1
% Call:
%     b = CS4300_empty_clause(Ui);
% Author:
%     T. Henderson
%     UU
%     Summer 2014
%

b = 0;
if isempty(Ui)
    return
end

num_clauses = length(Ui);
for c = 1:num_clauses
    if isempty(Ui(c).clauses)
        b = 1;
        return
    end
end
