function next_state = CS4300_Wumpus_transition(state,action,board)
% CS4300_Wumpus_transition - transition function for Wumpus action
% On input:
%     state (1x3 vector): [x,y,dir] state of agent
%     action (int): agent action
%         1: move forward
%         2: turn (rotate) right 
%         3: turn (rotate) left 
%         4: grab (gold)
%         5: shoot arrow (in direction of agent)
%         6: climb out of world (if in cell [1;1])
%     board (4x4 array): Wumpus world layout
%         0: means empty cell
%         1: means pit in cell
%         2: means gold (only) in cell
%         3: means Wumpus (only) in cell
%         4: means gold and Wumpus in same cell
% Call:
%     ns = CS4300_Wumpus_transition([1,1,0],1,...
%          [0,0,0,0;1,0,0,0;2,0,0,0;0,0,0,0,3]);
% Author:
%     T. Henderson
%     UU
%     Fall 2015
%

FORWARD = 1;
RIGHT = 2;
LEFT = 3;
GRAB = 4;
SHOOT = 5;
CLIMB = 6;

next_state = state;
x = state(1);
y = state(2);
d = state(3);
if action==FORWARD
    if (y==1&d==3)...
            | (y==4&d==1)...
            | (x==1&d==2)...
            | (x==4&d==0)
        return
    end
    if d==0
        x = x + 1;
    elseif d==1
        y = y + 1;
    elseif d==2
        x = x - 1;
    else
        y = y - 1;
    end
    next_state = [x,y,d];
    r = 4 - y + 1;
    c = x;
    if board(r,c)==1|board(r,c)==3|board(r,c)==4
        next_state = [-1,-1,-1];
    end
    return
end
if action==RIGHT
    next_state(3) = rem(d+3,4);
elseif action==LEFT
    next_state(3) = rem(d+1,4);
end
