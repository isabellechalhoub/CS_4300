function action = CS4300_agent1(percept)
% CS4300_agent1 - random agent example
%   It randomly either changes direction or moves forward
% On input:
%   percept (1x5 Boolean vector): percept values
%       (1): Stench
%       (2): Pit
%       (3): Glitters
%       (4): Bumped
%       (5): Screamed
% On output:
%   action (int): action selected by agent
%       FORWARD = 1;
%       ROTATE_RIGHT = 2;
%       ROTATE_LEFT = 3;
%       GRAB = 4; -- NOT USED
%       SHOOT = 5; -- NOT USED
%       CLIMB = 6; -- NOT USED

% Call:
%   a = CS4300_agent1([0,1,0,0,0]);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017
%

% Choose a random action by randomly picking between 1-3
action = ceil((3)*rand(1));

end