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

end

