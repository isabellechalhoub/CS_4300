function [ KB_out ] = CS4300_gen_adHoc( KB, char )
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
num_clauses = length(KB) + 1;
KB_out(num_clauses).clauses = [];

for x=1:4
    for y=1:4
        KB_out(num_clauses).clauses = [KB_out(num_clauses).clauses, char,...
            num2str(x), num2str(y), BLANK];
    end 
end

end

