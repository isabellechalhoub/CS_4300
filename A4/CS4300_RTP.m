function Sip = CS4300_RTP(sentences,thm,vars)
% CS4300_RTP - resolution theorem prover
% On input:
%     sentences (CNF data structure): array of conjuctive clauses
%       (i).clauses
%           each clause is a list of integers (- for negated literal)
%     thm (CNF data structure): 1 disjunctive clause to be tested
%     vars (1xn vector): list of variables (positive integers)
% On output:
%     Sip (CNF data structure): results of resolution
%        []: proved sentence |- thm
%        not []: thm does not follow from sentences
% Method:
%  Let S1 = S.
% Let i = 1.
% LOOP until i = n + 1.
% Discard members of Si in which a literal and its
%    complement appear, to obtain Sip.
% Let Ti be the set of parent clauses in Sip in which Pi or
%    -Pi appears.
% Let Ui be the set of resolvent clauses obtained by
%     resolving (over Pi ) every pair of clauses C U {Pi} and
%     D U {-Pi} in Ti.
% Set Si+1 equal to (Sip\Ti) U Ui . (Eliminate Pi ).
% Let i be increased by 1.
% ENDLOOP.
% Output Sn+1.
% Call:  (example from Russell & Norvig, p. 252)
%     DP(1).clauses = [-1,2,3,4];
%     DP(2).clauses = [-2];
%     DP(3).clauses = [-3];
%     DP(4).clauses = [1];
%     thm = [4];
%     vars = [1,2,3,4];
%     Sr = CS4300_RTP(DP,thm,vars);
% Author:
%     T. Henderson
%     UU
%     Summer 2014
%

num_sentences = length(sentences);
len_thm = length(thm(1).clauses);
not_thm = -thm(1).clauses;
for ind = 1:len_thm
    num_sentences = num_sentences + 1;
    sentences(num_sentences).clauses = [not_thm(ind)];
end

n = length(vars);
Sipn = sentences;
for i = 1:n
    Sip = CS4300_elim_L_nL(Sipn);
    Ti = CS4300_parent_clauses(Sip,vars(i));
    Ui = CS4300_resolvent_clauses(Ti,vars(i));
    if CS4300_empty_clause(Ui)
        Sip = [];
        return
    end
    Sipn = CS4300_update_S(Sip,Ti,Ui);
end
Sip = Sipn;
