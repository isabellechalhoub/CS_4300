function [ KB_out ] = CS4300_gen_Gold_Wumpus( KB, char )
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

translation = [1,1; 2,1; 3,1; 4,1;
               1,2; 2,2; 3,2; 4,2;
               1,3; 2,3; 3,3; 4,3;
               1,4; 2,4; 3,4; 4,4];

KB_out = KB;           
num_clauses = length(KB);

for i=1:16
    exclusion_count = i + 1;
    while exclusion_count < 17
        num_clauses = num_clauses + 1;
        KB_out(num_clauses).clauses = [strcat('-', char),...
            num2str(translation(i, 1)),num2str(translation(i,2)),...
            BLANK, strcat('-', char), num2str(translation(exclusion_count, 1)),...
            num2str(translation(exclusion_count, 2))];
        exclusion_count = exclusion_count + 1;
    end
end

end

