function [ vars_out ] = CS4300_gen_vars()
% CS4300_gen_vars - generate all atom names
%   On input:
%       N/A
%   On output:
%       vars_out : the struct of all atoms
%   Call:
%       vars = CS4300_gen_vars();
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017
%

vars_out = [];

chars = ['B', 'G', 'P', 'S', 'W'];

count = 1;

for c=1:5
    for x=1:4
        for y=1:4
            vars_out(count).var = [chars(c), num2str(x), num2str(y)];
            count = count + 1;
        end
    end
end

end

