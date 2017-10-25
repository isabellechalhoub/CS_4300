function [ a,thm1,thm2 ] = CS4300_find_safe_neighbor( KB, loc, wumpus)
%CS4300_FIND_SAFE_UNVISITED Summary of this function goes here
%   Detailed explanation goes here

% translation = [0, 4, 8, 12;
%                1, 5, 9, 13;
%                2, 6, 10, 14;
%                3, 7, 11, 15];

translation = [0,1,2,3;
               4,5,6,7;
               8,9,10,11;
               12,13,14,15];
           
a = '';
thm1 = [];
thm2 = [];
P = 33;
W = 65;

thm(1).clauses = translation(loc(1), loc(2)) + P;
p = CS4300_Ask(KB, thm);

thm(1).clauses = -1*(translation(loc(1), loc(2)) + P);
n_p = CS4300_Ask(KB, thm);

if wumpus == 1
    thm(1).clauses = translation(loc(1), loc(2)) + W;
    w = CS4300_Ask(KB, thm);

    thm(1).clauses = -1*(translation(loc(1), loc(2)) + W);
    n_w = CS4300_Ask(KB, thm);
else
    w = 0;
    n_w = 1;
end

if p && ~n_p
    a = 'pit';
    thm1 = translation(loc(1), loc(2)) + P;
elseif w && ~n_w
    a = 'wumpus';
    thm1 = translation(loc(1), loc(2)) + W;
elseif n_p && n_w
    a = 'safe';
    thm1 = -1*(translation(loc(1), loc(2)) + P);
    thm2 = -1*(translation(loc(1), loc(2)) + W);
else
    a = 'n/a';
end
end

