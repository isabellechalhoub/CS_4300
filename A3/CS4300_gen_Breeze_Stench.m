function [ KB_out, KBi_out ] = CS4300_gen_Breezes( KB, KBi, char1, char2, translation)
% CS4300_gen_Breeze_Stench - generate breeze disjuctions with pits or
%   stench disjunctions with the wumpus
%   On input:
%       KB   : the knowledge base the disjunctions should be added to
%       char1 : the character that should be used for the first part of the
%               disjunction. This should be 'B' or 'S'
%       char2 : the character that should be used for the second part of the
%               disjunction. This should be 'P' or 'W' 
%               (correlating to the matching character to the first character)
%   On output:
%       KB_out : The updated knowledge base
%   Call:
%       KB = CS4300_gen_Breeze_Stench(KB, 'B', 'P');
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017
%

BLANK = ' ';

KB_out = KB;
KBi_out = KBi;

num_clauses = length(KB);

if char1 == 'B'
    char1_start = 1;
    char2_start = 33;
elseif char1 == 'S'
    char1_start = 49;
    char2_start = 65;
end

for x = 1:4
    for y = 1:4
        neis = CS4300_Wumpus_neighbors(x,y);
        num_neis = length(neis(:,1));
        nei_clause = [];
        bs_arr = [];
        nei_arr = [];
        for n = 1:num_neis
            num_clauses = num_clauses + 1;
            KB_out(num_clauses).clauses = [char1, num2str(x), num2str(y),...
                BLANK,...
                strcat('-', char2),num2str(neis(n,1)),num2str(neis(n,2))];
            nei_clause = [nei_clause, BLANK, char2, num2str(neis(n,1)),...
                num2str(neis(n,2))];
            
            first_num = translation(x,y) + char1_start;
            second_num = (translation(neis(n,1), neis(n,2)) + char2_start);
            
            nei_arr = [nei_arr, second_num];
            
            second_num = -1 * second_num;
            bs_arr = [first_num, second_num];
            KBi_out(num_clauses).clauses = bs_arr;
        end
        num_clauses = num_clauses + 1;
        KB_out(num_clauses).clauses = [strcat('-', char1), num2str(x), num2str(y),...
            nei_clause];
 
        first_num = -1 * (translation(x,y) + char1_start); 
        bs_arr = [first_num, nei_arr];
        KBi_out(num_clauses).clauses = [bs_arr];
    end
end

