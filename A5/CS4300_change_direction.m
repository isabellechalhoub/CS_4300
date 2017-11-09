function [ moves ] = CS4300_change_direction( turn_dir, dir )
% CS4300_change_direction - creates a serious of Move turns for the agent
%   to move from the current direction to a new direction
% On input:
%     turn_dir : the new direction we want to get to
%     dir : the current agent direction
% On output:
%     moves (1x1||2) : series of turns needed to achieve new direction
% Call:
%     d = CS4300_change_direction(3, 0);
% Author:
%     Isabelle Chalhoub     Karla Kraiss
%     UU
%     Fall 2016
%

RIGHT = 2;
LEFT = 3;

if turn_dir == dir
    moves = [];
    return
elseif (turn_dir-1 == dir) || (turn_dir-1 < 0)
    moves = [LEFT];
    return
elseif (turn_dir+1 == dir) || (turn_dir+1 > 3)
    moves = [RIGHT];
    return
else
    moves = [LEFT;LEFT];
    return
end

end

