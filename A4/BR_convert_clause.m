function clause_out = BR_convert_clause(clause,vars)
%

MINUS = '-';
BLANK = ' ';

clause_out = [];

clause(end+1) = BLANK;

num_vars = length(vars);
len_clause = length(clause);
index = 1;
while index<len_clause
    if clause(index)==MINUS
        a = -1;
    else
        a = 1;
    end
    [v,index] = BR_get_next_var(clause,index,len_clause);
    ind = 0;
    while ind<num_vars
        ind = ind + 1;
        if strcmp(v,vars(ind).var)
            clause_out = [clause_out,a*ind];
            ind = num_vars+1;
        end
    end
end
clause_out = sort(unique(clause_out));
tch = 0;
    