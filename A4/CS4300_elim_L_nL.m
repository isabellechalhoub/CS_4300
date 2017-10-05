function Sip = CS4300_elim_L_nL(S)
% CS4300_elim_L_nL - remove a disjunction with both a literal
%   and its negation
% On input:
%     S (CNF data structure): array of conjuctive clauses
%       (i).clauses
%           each clause is a list of integers (- for negated literal)
% On output:
%     Sip (CNF data structure): results of disjunction elimination
% Call:
%     Se = CS4300_elim_L_nL(Sip);
% Author:
%     T. Henderson
%     UU
%     Summer 2014
%

len_S = length(S);
num_Sip = 0;
for s = 1:len_S
    clauses = S(s).clauses;
    if ~isempty(clauses)
        len_c = length(clauses);
        found = 0;
        for c = 1:len_c
            if ~isempty(find(-clauses(c)==clauses))
                found = 1;
            end
        end
        if found==0
            num_Sip = num_Sip + 1;
            Sip(num_Sip).clauses = clauses;
        end
    end
end
