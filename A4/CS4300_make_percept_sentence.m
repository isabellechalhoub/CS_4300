function sentence = CS4300_make_percept_sentence(percept,x,y)
% CS4300_make_percept_sentence - create logical sentence from percept
% On input:
%   percept (1x5 Boolean vector): percept
%       [Stench,Breeze,Glitter,Scream,Bump]
%   x (int): x location of agent
%   y (int): y location of agent
% On output:
%   sentence (KB struct): logical sentence (CNF)
%       (1).clauses (int): c1 (index of Sxy if stench), else -c1
%       (2).clauses (int): c2 (index of Bxy if breeze), else -c2
%       (3).clauses (int): c3 (index of Gxy if glitter), else -c3
%       (4).clauses (int): c4 (index of Cxy if scream), else -c4
%       (5).clauses (int): c5 (index of Exy if bump), else -c5
% Call:
%   s = CS4300_make_percept_sentence([0,1,0,0,0],3,2);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017

% translation = [0, 4, 8, 12;
%                1, 5, 9, 13;
%                2, 6, 10, 14;
%                3, 7, 11, 15];

translation = [0,1,2,3;
               4,5,6,7;
               8,9,10,11;
               12,13,14,15];

% B = 1:16
% G = 17:32
% P = 33:48
% S = 49:64
% W = 65:80

% Convert percept to a logical sentence

% Stench
if percept(1) == 1
    sentence(1).clauses = translation(x, y) + 49;
else
    sentence(1).clauses = -1*(translation(x, y) + 49);
end

% Breeze
if percept(2) == 1
    sentence(2).clauses = translation(x, y) + 1;
else
    sentence(2).clauses = -1*(translation(x, y) + 1);
end

% Glitter
if percept(3) == 1
    sentence(3).clauses = translation(x, y) + 17;
else
    sentence(3).clauses = -1*(translation(x, y) + 17);
end