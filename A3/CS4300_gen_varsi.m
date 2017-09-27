function [ varsi_out ] = CS4300_gen_varsi(translation)
% CS4300_gen_varsi - generate all atom ints
%   On input:
%       N/A
%   On output:
%       vars_out : the struct of all atoms (as positive ints)
%   Call:
%       varsi = CS4300_gen_varsi();
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017
%

varsi_out = [];

start = [1, 17, 33, 49, 65];

count = 1;

for c=1:5
    for x=1:4
        for y=1:4
            varsi_out(count).var = [(translation(x,y) + start(c))];
            count = count + 1;
        end
    end
end

end

