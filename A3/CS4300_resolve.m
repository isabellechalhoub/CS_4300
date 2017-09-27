function [ resolvents ] = CS4300_resolve( clause1, clause2 )
% CS4300_resolve - resolve two sentences to a set of new sentences
%   On input:
%       clause1 : the first disjunction
%       clause2 : the second disjunction
%   On output:
%       resolvents : the resolvent set of combined disjunctions or the empty
%           set if a contradiction is found
%   Call:
%       resolvents = CS4300_resolve(KBi(i).clause, KBi(j).clause);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017
%

% Add both disjunctions to a new disjunction (call unique?)
%   iterate i/j looking for contradictions
%   if found - remove both, continue rest of list
%   return resolved list

resolvents = [clause1, clause2];
to_remove = [];

for i=1:length(resolvents)
    if length(resolvents) < 2
        break;
    end
    for j=i+1:length(resolvents)
        if resolvents(i) + resolvents(j) == 0
            to_remove = [to_remove, resolvents(i), resolvents(j)];
        end
    end
end
if ~isempty(to_remove)
    for k=1:length(to_remove)
        resolvents = resolvents(resolvents~=to_remove(k));
    end
end

end

