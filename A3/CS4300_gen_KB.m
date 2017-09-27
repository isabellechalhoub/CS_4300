function [KB, KBi, vars, varsi] = CS4300_gen_KB
% CS4300_gen_KB - generate Wumpus World logic in KB
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
%       [KB,KBi,vars] = CS4300_gen_KB();
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017
%

translation = [0, 4, 8, 12;
               1, 5, 9, 13;
               2, 6, 10, 14;
               3, 7, 11, 15];

KB = [];
KBi = [];
vars = CS4300_gen_vars();
varsi = CS4300_gen_varsi(translation);

% Generate Breeze Disjunctions
[KB,KBi] = CS4300_gen_Breeze_Stench(KB, KBi, 'B', 'P', translation);

% Generate Gold Disjunctions
[KB,KBi] = CS4300_gen_Gold_Wumpus(KB, KBi, 'G');

% Generate Pit Disjunctions
[KB,KBi] = CS4300_gen_Pit_Exclusion(KB, KBi, 'G', translation);
[KB,KBi] = CS4300_gen_Pit_Exclusion(KB, KBi, 'W', translation);

% Generate Stench Disjunctions
[KB,KBi] = CS4300_gen_Breeze_Stench(KB, KBi, 'S', 'W', translation);

% Generate Wumpus Disjunctions
[KB,KBi] = CS4300_gen_Gold_Wumpus(KB, KBi, 'W');

% Generate Ad Hoc Disjunctions
[KB,KBi] = CS4300_gen_adHoc(KB, KBi, 'G', translation);
[KB,KBi] = CS4300_gen_adHoc(KB, KBi, 'W', translation);

end

