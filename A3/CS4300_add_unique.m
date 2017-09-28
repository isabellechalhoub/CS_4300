function [ new_res ] = CS4300_add_unique( resolvents )
% CS4300_add_unique - remove duplicate clauses from a given struct
%   On input:
%       resolvents : the struct to remove duplicate clauses from
%   On output:
%       new_res : the fixed struct with no dupes
%   Call:
%       new_res = CS4300_add_unique(resolvents);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017
%

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