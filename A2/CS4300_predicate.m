function [ consistent ] = CS4300_predicate( v1, d1, v2, d2 )
%CS4300_predicate - Checks for domain consistency based on the
%   relationship matrix
% On input:
%   v1: First vertex
%   d1: First vertex domain
%   v2: Second vertex
%   d2: Second vertex domain
% On ouput:
%   consistent - true if the arc is arc consistent, otherwise false
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017%

relationship = [1, 0, 1;
                0, 1, 1;
                1, 1, 0];
            
consistent = relationship(d1, d2);

end

