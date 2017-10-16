function [ KB_out, KBi_out ] = CS4300_gen_adHoc( KB, KBi, char, translation )
% CS4300_gen_adHoc - generate the adHoc disjunctions for wumpus & gold.
%   On input:
%       KB   : the knowledge base the disjunctions should be added to
%       char : the character that should be used for the disjunctions
%              Either a 'W' or 'G' 
%   On output:
%       KB_out : The updated knowledge base
%   Call:
%       KB = CS4300_gen_adHoc(KB, 'W');
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017
%

BLANK = ' ';

KB_out = KB;
KBi_out = KBi;

num_clauses = length(KB) + 1;

KB_out(num_clauses).clauses = [];
KBi_out(num_clauses).clauses = [];
adHoc_arr = [];

if char == 'G'
    start = 17;
elseif char == 'W'
    start = 65;
end

for x=1:4
    for y=1:4
        KB_out(num_clauses).clauses = [KB_out(num_clauses).clauses, char,...
            num2str(x), num2str(y), BLANK];
        new_num = translation(x,y) + start;
        adHoc_arr = [adHoc_arr, new_num];
    end 
end
KBi_out(num_clauses).clauses = [adHoc_arr];

end

