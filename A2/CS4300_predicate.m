function [ consistent ] = CS4300_predicate( v1, d1, v2, d2 )
%CS4300_PREDICATE Summary of this function goes here
%   Detailed explanation goes here

relationship = [1, 0, 1;
                0, 1, 1;
                1, 1, 0];
            
consistent = relationship(d1, d2);
            
%consistent = ~(d1 == 2 && d2 == 3);

end

