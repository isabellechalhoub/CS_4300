function [ kill ] = CS4300_make_kill_plan(agent,wx,wy)
%CS4300_MAKE_KILL_PLAN Summary of this function goes here
%   Detailed explanation goes here

SHOOT = 5;
kill = SHOOT;

% We are in the same row as the wumpus
if agent.x == wy
    % turn
    if agent.y < wx
        turn_dir = 1;
    else
        turn_dir = 3;
    end
    kill = [CS4300_change_direction(turn_dir,agent.dir);kill];
% We are in the same column as the wumpus
elseif agent.y == wx
    if agent.x < wy
        turn_dir = 0;
    else
        turn_dir = 2;
    end
    kill = [CS4300_change_direction(turn_dir,agent.dir);kill];
end

