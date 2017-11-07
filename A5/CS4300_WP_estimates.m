function [pits,Wumpus] = CS4300_WP_estimates(breezes,stenches,num_trials)
% CS4300_WP_estimates - estimate pit and Wumpus likelihoods
% On input:
%   breezes (4x4 Boolean array): presence of breeze percept at cell
%       -1: no knowledge
%       0: no breeze detected
%       1: breeze detected
%   stenches (4x4 Boolean array): presence of stench in cell
%       -1: no knowledge
%       0: no stench detected
%       1: stench detected
%   num_trials (int): number of trials to run (subset will be OK)
% On output:
%   pits (4x4 [0,1] array): likelihood of pit in cell
%   Wumpus (4x4 [0 to 1] array): likelihood of Wumpus in cell
% Call:
%   breezes = -ones(4,4);
%   breezes(4,1) = 1;
%   stench = -ones(4,4);
%   stench(4,1) = 0;
%   [pts,Wumpus] = CS4300_WP_estimates(breezes,stench,10000)
% pts =
%   0.2021 0.1967 0.1956 0.1953
%   0.1972 0.1999 0.2016 0.1980
%   0.5527 0.1969 0.1989 0.2119
%        0 0.5552 0.1948 0.1839
%
% Wumpus =
%   0.0806 0.0800 0.0827 0.0720
%   0.0780 0.0738 0.0723 0.0717
%        0 0.0845 0.0685 0.0803
%        0      0 0.0741 0.0812
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   UU
%   Fall 2017
%

pit_count = 0;
pit_sum = zeros(4,4);
pit_probability = 0.2;

wump_count = 0;
wump_sum = zeros(4,4);

for i=1:num_trials
    pit_board = CS4300_gen_pit_board(pit_probability);
    if CS4300_check_board(pit_board, breezes)
        pit_sum  = pit_sum + pit_board;
        pit_count = pit_count + 1;
    end
    
    wump_board = CS4300_gen_wumpus_board();
    if CS4300_check_board(wump_board, stenches)
        wump_sum = wump_sum + wump_board;
        wump_count = wump_count + 1;
    end
end

pits = pit_sum/pit_count;
Wumpus = wump_sum/wump_count;








