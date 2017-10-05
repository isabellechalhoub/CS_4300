function clause2 = CS4300_compact_clause(clause)
%

clause2 = [];

if isempty(clause)
    return
end

len_c = length(clause);
if len_c==1
    clause2 = clause;
    return
end

clause2 = sort(unique(clause));
