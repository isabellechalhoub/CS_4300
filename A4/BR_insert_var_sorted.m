function vars_out = BR_insert_var_sorted(vars,v)
%

vars_out = vars;

if isempty(vars)
    vars_out(1).var = v;
    return
end

num_vars = length(vars);
index = 0;
while index<num_vars
    index = index + 1;
    found = strcmp(v,vars(index).var);
    if found==1
        return
    end
    [~,idx] = sort({v;vars(index).var});
    if idx(1)==1
        vars_out(end+1).var = vars_out(end).var;
        for ii = num_vars:-1:index+1
            vars_out(ii).var = vars_out(ii-1).var;
        end
        vars_out(index).var = v;
        return
    end
end
vars_out(end+1).var = v;
