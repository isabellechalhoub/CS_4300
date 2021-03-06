function [ kill ] = CS4300_make_kill_plan(agent,wx,wy)
% CS4300_make_kill_plan - creates a plan to kill the wumpus
% On input:
%     agent (1x3 vector): x,y,dir of agent
%     wx : x coord of wumpus
%     wy : y coord of wumpus
% On output:
%     kill (kx1) : series of actions to take to kill the wumpus
% Call:
%     kill = CS4300_A_star_Man([1,1,0],1,2);
% Author:
%     Isabelle Chalhoub     Karla Kraiss
%     UU
%     Fall 2016
%


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

