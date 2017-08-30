function action = CS4300_Example1(percept)
% CS4300_Example1 - simple agent example
%    Takes actions: right, left, climb
% On input:
%     percept (1x5 Boolean vector): percept values
%      (1): Stench
%      (2): Breeze
%      (3): Glitters
%      (4): Bumped
%      (5): Screamed
% On output:
%     action (int): action selected by agent
%       FORWARD = 1;
%       ROTATE_RIGHT = 2;
%       ROTATE_LEFT = 3;
%       GRAB = 4;
%       SHOOT = 5;
%       CLIMB = 6;
% Call:
%     a = CS4300_Example1([0,1,0,0,0]);
% Author:
%     T. Henderson
%     UU
%     Summer 2015
%

persistent state

FORWARD = 1;
ROTATE_RIGHT = 2;
ROTATE_LEFT = 3;
GRAB = 4;
SHOOT = 5;
CLIMB = 6;

if isempty(state)
    state = 0;
end

switch state
    case 0
        action = ROTATE_RIGHT;
        state = 1;
    case 1
        action = ROTATE_LEFT;
        state = 2;
    case 2
        action = CLIMB;
        state = 2;
end
