function [ KB_out, KBi_out ] = CS4300_gen_Pit_Exclusion( KB, KBi, char, translation )
% CS4300_gen_Pit_Exclusion - generate pit exclusion disjunctions
%   On input:
%       KB   : the knowledge base the disjunctions should be added to
%       char : the character that should be paired with the excluded pit 
%              disjunctions. Either a 'W' or 'G' 
%   On output:
%       KB_out : The updated knowledge base
%   Call:
%       KB = CS4300_gen_Pit_Exclusion(KB, 'W');
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017
%

BLANK = ' ';

KB_out = KB;
KBi_out = KBi;
num_clauses = length(KB);

if char == 'G'
    start = 17;
elseif char == 'W'
    start = 65;
end

for x=1:4
    for y=1:4
        num_clauses = num_clauses + 1;
        KB_out(num_clauses).clauses = ['-P', num2str(x), num2str(y),...
            BLANK,...
            strcat('-', char), num2str(x), num2str(y)];
        
        num1 = (translation(x,y) + 33) * -1;
        num2 = (translation(x,y) + start) * -1;
        KBi_out(num_clauses).clauses = [num1, num2];
    end 
end

end

