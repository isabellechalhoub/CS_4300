function [v,ind] = BR_get_next_var(clause,index,len_clause)
%

BLANK = ' ';

v = [];
ind = index;
while ind<len_clause
    if clause(ind)=='-'
        ind = ind + 1;
    elseif clause(ind)==BLANK
        ind = ind + 1;
        return
    else
        v = [v,clause(ind)];
        ind = ind + 1;
    end
end
