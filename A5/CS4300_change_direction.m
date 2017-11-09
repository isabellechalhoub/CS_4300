function [ moves ] = CS4300_change_direction( turn_dir, dir )
%CS4300_CHANGE_DIRECTION Summary of this function goes here
%   Detailed explanation goes here

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

