function [KB,KBi,vars] = BR_gen_KB
% BR_gen_KB - generate Wumpus World logic in KB with probabilities
% On input:
%     N/A
% On output:
%     KB (CNF KB): KB with Wumpus logic (atom symbols)
%     KBi (CNF KB): KB with Wumpus logic (integers)
%     vars(struct: vector of strings): list of atom strings
% Call:
%     [KB,KBi,vars] = BR_gen_KB;
% Author:
%     T. Henderson
%     UU
%     Summer 2017
%

KB = [];

KB = BR_gen_Breezes(KB);
KB = BR_gen_Stenches(KB);
KB = BR_gen_Wumpus_Gold(KB);
KB = BR_gen_mutual_exclusions(KB);
KB = BR_gen_ad_hoc(KB);

vars = BR_Wumpus_vars(KB);
KBi = BR_convert_Wumpus_KB(KB,vars);
%[KB,KBi] = BR_add_sim_data(KB,KBi,vars);
