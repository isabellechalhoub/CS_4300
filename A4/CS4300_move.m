function [x_new,y_new] = CS4300_move(x,y,dir)
% CS4300_move - generate new agent location with move
% On input:
%     x (int): x location
%     y (int): y location
%     dir (int): direction (0: right; 1: up; 2: left; 3: down)
% On output:
%     x_new (int): new x location
%     y_new (int): new y location
% Call:
%     [xn,yn] = CS4300_move(1,1,0);
% Author:
%     T. Henderson
%     UU
%     Fall 2015
%

x_new = x;
y_new = y;

if dir==0
    if x<4
        x_new = x + 1;
    end
    return
end

if dir==1
    if y<4
        y_new = y + 1;
    end
    return
end

if dir==2
    if x>1
        x_new = x - 1;
    end
    return
end

if dir==3
    if y>1
        y_new = y - 1;
    end
    return
end