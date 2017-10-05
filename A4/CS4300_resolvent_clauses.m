function Ui = CS4300_resolvent_clauses(Ti,P)
% CS4300_resolvent_clauses - results of resolving clauses with P
%   or its negation
% On input:
%     Ti (CNF data structure): array of conjuctive clauses
%       (i).clauses
%           each clause is a list of integers (- for negated literal)
%     P (int): literal
% On output:
%     Ui (CNF data structure): results of disjunction elimination
% Call:
%     Ui = CS4300_resolvent_clauses(Ti,4);
% Author:
%     T. Henderson
%     UU
%     Summer 2014
%

len_Ti = length(Ti);
sorted_clauses = zeros(len_Ti,2);

for ind = 1:len_Ti
    pind = find(Ti(ind).clauses==P);
    if length(pind)>1
        pind = pind(1);
    end
    nind = find(Ti(ind).clauses==(-P));
    if length(nind)>1
        nind = nind(1);
    end
    if ~isempty(pind)
        sorted_clauses(ind,1) = 1;
        sorted_clauses(ind,2) = pind;
    else
        sorted_clauses(ind,1) = -1;
        sorted_clauses(ind,2) = nind;
    end
end
indexes_pos = find(sorted_clauses(:,1)>0);
num_pos = length(indexes_pos);
indexes_neg = find(sorted_clauses(:,1)<0);
num_neg = length(indexes_neg);
if num_pos*num_neg==0
    Ui = [];
    return
end

len_Ui = 0;
for p = 1:num_pos
    p_clause = Ti(indexes_pos(p)).clauses;
    p_index = sorted_clauses(indexes_pos(p),2);
    for n = 1:num_neg
        n_clause = Ti(indexes_neg(n)).clauses;
        len_Ui = len_Ui + 1;
        n_index = sorted_clauses(indexes_neg(n),2);
        Ui(len_Ui).clauses = ...
            [p_clause(1:p_index-1),p_clause(p_index+1:end), ...
             n_clause(1:n_index-1),n_clause(n_index+1:end)];
    end
end
