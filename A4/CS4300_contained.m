function b = CS4300_contained(c1,c2)
%

b = 0;

if isempty(c1)
    b = 1;
    return
end

if isempty(c2)
    return
end

len1 = length(c1);
len2 = length(c2);

for i1 = 1:len1
    clause1 = c1(i1).clauses;
    clause1u = unique(clause1);
    clause1us = sort(clause1u);
    found = 0;
    for i2 = 1:len2
        clause2 = c2(i2).clauses;
        clause2u = unique(clause2);
        clause2us = sort(clause2u);
        if length(clause1us)==length(clause2us)&min(clause1us==clause2us)==1
            found = 1;
        end
    end
    if found==0
        return
    end
end
b = 1;
