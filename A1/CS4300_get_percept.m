function percept = CS4300_get_percept(board,agent,bumped,screamed)
% CS4300_get_percept - get percept values from current state
% On input:
%     board (4x4 array): Wumpus world board
%     agent (agent data structure): agent current state
%       .x (int): x location
%       .y (int): y location
%       .alive (Boolean): 0 if dead, else 1
%       .gold (Boolean): 0 if not holding gold, else 1
%       .dir (int): facing: 0 (right), 1 (up), 2 (left), 3 (down)
%       .succeed (Boolean): has gold and climbed out
%       .climbed (Boolean): at home location and climbed out
%     bumped (Boolean): bumped wall (previous time)
%     screamed (Boolean): Wumpus screamed previous time)
% On output:
%     percept (1x5 Boolean array): percept values
%       (1): Stench variable (neighbors wumpus)
%       (2): Breeze variable (neighbors pit)
%       (3): Glitter variable (cell contains gold)
%       (4): Bump variable (hit wall trying to move)
%       (5): Scream variable (arrow killed wumpus)
% Call:
%     p = CS4300_get_percept(b,a,0,0);
% Author:
%     T. Henderson
%     UU
%     Summer 2015
%

PIT = 1;
GOLD = 2;
WUMPUS = 3;
BOTH = 4;

NUM_ROWS = 4;
NUM_PERCEPTS = 5;

FORWARD = 1;
ROTATE_RIGHT = 2;
ROTATE_LEFT = 3;
GRAB = 4;
SHOOT = 5;
CLIMB = 6;

loc_r = NUM_ROWS - agent.y + 1;
loc_c = agent.x;

offsets = [0,1;-1,0;1,0;0,-1];
percept = zeros(1,NUM_PERCEPTS);
for d = 1:4
    r = loc_r + offsets(d,1);
    c = loc_c + offsets(d,2);
    if r>0&r<5&c>0&c<5
        if board(r,c)==PIT % PIT in cell
            percept(2) = 1;
        elseif  board(r,c)==WUMPUS % WUMPUS in cell
            percept(1) = 1;
        elseif board(r,c)==BOTH % GOLD and WUMPUS in cell
            percept(1) = 1;
        end
    end
end

if board(loc_r,loc_c)==GOLD
    percept(3) = 1;
end

if bumped==1
    percept(4) = 1;
end

if screamed==1
    percept(5) = 1;
end
