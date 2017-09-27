function Sip = CS4300_RTP(sentences,thm,vars)
% CS4300_RTP - resolution theorem prover
%   On input:
%       sentences (CNF data structure): array of conjuctive clauses
%           (i).clauses
%               each clause is a list of integers (- for negated literal)
%       thm (CNF datastructure): a disjunctive clause to be tested
%       vars (1xn vector): list of variables (positive integers)
%   On output:
%       Sip (CNF data structure): results of resolution
%           []: proved sentence |- thm
%           not []: thm does not follow from sentences
%   Call: (example from Russell & Norvig, p. 252)
%       DP(1).clauses = [-1,2,3,4];
%       DP(2).clauses = [-2];
%       DP(3).clauses = [-3];
%       DP(4).clauses = [1];
%       thm(1).clauses = [4];
%       vars = [1,2,3,4];
%       Sr = CS4300_RTP(DP,thm,vars);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017
%

% For every pair of clauses in KBi, combine them,
%   If you find two literals that negate each other, remove them from the
%   new clause
%   If this results in an empty list - contradiction - return true
%   Else, add the new clause and continue.
%   Before adding the clause, call unique!

num_clauses = length(sentences);
for n=1:length(thm)
    num_clauses = num_clauses + 1;
    sentences(num_clauses).clauses = [thm(n).clauses];
end

num_resolvents = 1;

while true
    for i=1:length(sentences)
        for j=i+1:length(sentences)
            resolvents(num_resolvents).clauses = CS4300_resolve(sentences(i).clauses, sentences(j).clauses);
            if (isempty(resolvents(num_resolvents).clauses))
                Sip = [];
                return;
            end
            num_resolvents = num_resolvents + 1;
        end
    end
    resolvents = CS4300_check_dupes(resolvents, sentences);
    resolvents = CS4300_add_unique(resolvents);
    if isempty(resolvents)
        % TODO what do we return here?
        Sip = sentences;
        return;
    end
    
    % TODO need to only add unique resolvents
    sentences = [sentences, resolvents];
end
end

