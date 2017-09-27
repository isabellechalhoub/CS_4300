function [ new_res ] = CS4300_add_unique( resolvents )
%CS4300_ADD_UNIQUE Summary of this function goes here
%   Detailed explanation goes here

for i=1:length(resolvents)
    for j=i+1:length(resolvents)
        if isequal(resolvents(i).clauses, resolvents(j).clauses)
            resolvents(i).clauses = [];
        end  
    end
end

new_res = [];

new_index = 1;
for k=1:length(resolvents)
    if length(resolvents(k).clauses) ~= 0
        new_res(new_index).clauses = resolvents(k).clauses;
        new_index = new_index + 1;
    end
end

end