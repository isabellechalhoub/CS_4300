function KB_out = CS4300_Tell(KB,sentence)
% CS4300_Tell - Tell function for logic KB
% On input:
%   KB (KB struct): Knowledge base (CNF)
%       (k).clauses (1xp vector): disjunction clause
%   sentence (KB struct): query theorem (CNF)
%       (k).clauses (1xq vector): disjunction
% On output:
%   KB_out (KB struct): revised KB
% Call:
%   KB = CS4300_Tell([],[1]);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017

% Check that the disjunction doesn't already exist in the KB

KB_out = KB;

for i=1:length(KB_out)
    if sentence.clauses == KB_out(i).clauses
        return;
    end
end

% If the contradiction is already in the KB, replace it

for i=1:length(KB_out)
    if abs(sentence.clauses) == abs(KB_out(i).clauses)
        KB_out(i).clauses = sentence.clauses;
        return;
    end
end

% Else - just add it.
KB_out(length(KB_out) + 1).clauses = sentence.clauses;
