function [ KB_out ] = CS4300_gen_Breezes( KB, char1, char2)
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

num_clauses = length(KB);

for x = 1:4
    for y = 1:4
        neis = CS4300_Wumpus_neighbors(x,y);
        num_neis = length(neis(:,1));
        nei_clause = [];
        for n = 1:num_neis
            num_clauses = num_clauses + 1;
            KB_out(num_clauses).clauses = [char1, num2str(x), num2str(y),...
                BLANK,...
                strcat('-', char2),num2str(neis(n,1)),num2str(neis(n,2))];
            nei_clause = [nei_clause, BLANK, char2, num2str(neis(n,1)),...
                num2str(neis(n,2))];
        end
        num_clauses = num_clauses + 1;
        KB_out(num_clauses).clauses = [strcat('-', char1), num2str(x), num2str(y),...
            nei_clause];
    end
end

