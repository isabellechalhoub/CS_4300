function [board_out,agent_out,bumped,screamed] = CS4300_update(...
    board,agent,action)
% CS4300_update - update Wumpus World based on action selected
% On input:
%     board (4x4 array): Wumpus world board
%     agent (agent data structure): agent current state
%     action (int): action
% On output:
%     board_out (4x4 array): updated Wumpus world board
%     agent_out (agent data structure): agent next state
%     bumped (Boolean): if hit wall
%     screamed (Boolean): shooting arrow killed wumpus
% Call:
%     [bo,agent,bump,scream] = CS4300_update(b,agent,a);
% Author:
%     T. Henderson
%     UU
%     Summer 2015
%

NUM_ROWS = 4;
NUM_COLS = 4;

PIT = 1;
GOLD = 2;
WUMPUS = 3;
BOTH = 4;

FORWARD = 1;
ROTATE_RIGHT = 2;
ROTATE_LEFT = 3;
GRAB = 4;
SHOOT = 5;
CLIMB = 6;

dr = [0,-1,0,1];
dc = [1,0,-1,0];

loc_r = NUM_ROWS - agent.y + 1;
loc_c = agent.x;
agent_out = agent;
board_out = board;
bumped = 0;
screamed = 0;

if action==FORWARD
    rn = loc_r + dr(agent.dir+1);
    cn = loc_c + dc(agent.dir+1);
    if rn<1|rn>NUM_ROWS|cn<1|cn>NUM_COLS
        bumped = 1;
    else
        agent_out.x = cn;
        agent_out.y = NUM_ROWS - rn + 1;
        if board(rn,cn)==WUMPUS|board(rn,cn)==BOTH
            agent_out.alive = 0;
        end
        if board(rn,cn)==PIT
            agent_out.alive = 0;
        end
    end
    return
end

if action==ROTATE_RIGHT
    agent_out.dir = mod(agent.dir-1,4);
    return
end

if action==ROTATE_LEFT
    agent_out.dir = mod(agent.dir+1,4);
    return
end

if action==GRAB&board(loc_r,loc_c)==GOLD
    agent_out.gold = 1;
end

if action==SHOOT
    dir = agent.dir;
    done = 0;
    rn = loc_r;
    cn = loc_c;
    while done==0
        rn = rn + dr(dir+1);
        cn = cn + dc(dir+1);
        if rn<1|rn>NUM_ROWS|cn<1|cn>NUM_COLS
            done = 1;
        else
            if board(rn,cn)==WUMPUS
                screamed = 1;
                board_out(rn,cn) = 0;
                done = 1;
            elseif board(rn,cn)==BOTH
                screamed = 1;
                board_out(rn,cn) = GOLD;
                done = 1;
            end
        end
    end
end

if action==CLIMB&agent.x==1&agent.y==1
    agent_out.climbed = 1;
    if agent_out.gold==1
        agent_out.succeed = 1;
    end
end
