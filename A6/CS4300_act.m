function [x_new,y_new,dir_new] = CS4300_act(x,y,dir,action)
%

FORWARD = 1;
ROTATE_RIGHT = 2;
ROTATE_LEFT = 3;
GRAB = 4;
SHOOT = 5;
CLIMB = 6;

x_new = x;
y_new = y;
dir_new = dir;

if action<1|action>3
    return
end

if action==FORWARD
    if dir==0
        x_new = min(x+1,4);
    elseif dir==1
        y_new = min(y+1,4);
    elseif dir==2
        x_new = max(x-1,1);
    else
        y_new = max(y-1,1);
    end
    return
end

if action==ROTATE_RIGHT
    dir_new = rem(dir+3,4);
elseif action==ROTATE_LEFT
    dir_new = rem(dir+1,4);
end