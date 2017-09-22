function [KB] = CS4300_gen_KB
% BR_gen_KB - generate Wumpus World logic in KB
%   On input:
%       N/A
%   On output:
%       KB (CNF KB): KB with Wumpus logic (atom symbols)
%       (k).clauses (string): string form of disjunction
%       KBi (CNF KB): KB with Wumpus logic (integers)
%       (k).clauses (1xp vector): integer form of disjunction
%       vars(struct: vector of strings): list of atom strings
%       (k).var (string): name of atom
%   Call:
%       [KB,KBi,vars] = CS4300_gen_KB;
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017
%

KB = [];

% Generate Breeze Disjunctions
KB = CS4300_gen_Breeze_Stench(KB, 'B', 'P');

% Generate Gold Disjunctions
KB = CS4300_gen_Gold_Wumpus(KB, 'G');

% Generate Pit Disjunctions
KB = CS4300_gen_Pit_Exclusion(KB, 'G');
KB = CS4300_gen_Pit_Exclusion(KB, 'W');

% Generate Stench Disjunctions
KB = CS4300_gen_Breeze_Stench(KB, 'S', 'W');

% Generate Wumpus Disjunctions
KB = CS4300_gen_Gold_Wumpus(KB, 'W');

% Generate Ad Hoc Disjunctions
KB = CS4300_gen_adHoc(KB, 'G');
KB = CS4300_gen_adHoc(KB, 'W');

end

