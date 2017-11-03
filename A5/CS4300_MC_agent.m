function action = CS4300_MC_agent(percept)
% CS4300_MC_agent - Monte Carlo agent with a few informal rules
% On input:
%   percept (1x5 Boolean vector): percept from Wumpus world
%       (1): stench
%       (2): breeze
%       (3): glitter
%       (4): bump
%       (5): scream
% On output:
%   action (int): action to take
%       1: FORWARD
%       2: RIGHT
%       3: LEFT
%       4: GRAB
%       5: SHOOT
%       6: CLIMB
% Call:
%   a = CS4300_MC_agent(percept);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   UU
%   Fall 2017
%