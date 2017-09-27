function [ new_res ] = CS4300_check_dupes( resolvents, sentences )
% CS4300_check_dupes - check for duplicates between the new resolvents and
%   our KB.
%   On input:
%       resolvents : The new resolvents to check against the KB
%       sentences  : Our KB that we are checking dupes against
%   On output:
%       new_res : The resolvents that we can safely add to the KB
%   Call:
%       new_res = CS4300_check_dupes(resolvents, sentences);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017
%

for i=1:length(resolvents)
    for j=1:length(sentences)
        if length(resolvents(i).clauses) == length(sentences(j).clauses)
            if resolvents(i).clauses == sentences(j).clauses
                resolvents(i).clauses = [];
            end
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

