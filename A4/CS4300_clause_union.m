function cu = CS4300_clause_union(c1,c2)
%

if isempty(c1)
    cu = c2;
    return
end

if isempty(c2)
    cu = c1;
    return
end

len1 = length(c1);
len2 = length(c2);

cu = c1;
for i2 = 1:len2
    clause2 = c2(i2).clauses;
    clause2us = sort(unique(clause2));
    found = 0;
    for i1 = 1:length(cu)
        clause1us = sort(unique(cu(i1).clauses));
        if length(clause1us)==length(clause2us)&min(clause1us==clause2us)==1
            found = 1;
        end
    end
    if found==0
        cu(end+1).clauses = clause2us;
    end
end
