function [ KB_out, KBi_out ] = CS4300_gen_Gold_Wumpus( KB, KBi, char )
% CS4300_gen_Gold_Wumpus - generate gold and wumpus disjunctions
%   On input:
%       KB   : the knowledge base the disjunctions should be added to
%       char1 : the character that should be used for the disjunctions
%               either 'G' or 'W'
%   On output:
%       KB_out : The updated knowledge base
%   Call:
%       KB = CS4300_gen_Gold_Wumpus(KB, 'G');
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017
%

BLANK = ' ';

coord_translation = [1,1; 2,1; 3,1; 4,1;
               1,2; 2,2; 3,2; 4,2;
               1,3; 2,3; 3,3; 4,3;
               1,4; 2,4; 3,4; 4,4];

KB_out = KB;           
KBi_out = KBi;
num_clauses = length(KB);

if char == 'G'
    start = 16;
elseif char == 'W'
    start = 64;
end

for i=1:16
    exclusion_count = i + 1;
    while exclusion_count < 17
        num_clauses = num_clauses + 1;
        KB_out(num_clauses).clauses = [strcat('-', char),...
            num2str(coord_translation(i, 1)),num2str(coord_translation(i,2)),...
            BLANK, strcat('-', char), num2str(coord_translation(exclusion_count, 1)),...
            num2str(coord_translation(exclusion_count, 2))];
        
        num1 = (start + i) * -1;
        num2 = (start + exclusion_count) * -1;
        KBi_out(num_clauses).clauses = [num1, num2];
        exclusion_count = exclusion_count + 1;
    end
end

end

