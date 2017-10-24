function [ sentence ] = CS4300_make_sentence( x,y,char )
%CS4300_MAKE_SENTENCE Summary of this function goes here
%   Detailed explanation goes here

% translation = [0, 4, 8, 12;
%                1, 5, 9, 13;
%                2, 6, 10, 14;
%                3, 7, 11, 15];

translation = [0,1,2,3;
               4,5,6,7;
               8,9,10,11;
               12,13,14,15];

sentence(1).clauses = [];

end

