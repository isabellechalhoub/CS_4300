function [score,trace] = CS4300_WW1(max_steps,f_name,board)
% CS4300_WW1 - Wumpus World 1 simulator
% On input:
%     max_steps (int): maximum number of simulation steps
%     f_name (string): name of agent function
%     board (4x4 array): Wumpus world board
% On output:
%     score (int): agent score on game
%     trace (nx3 int array): trace of state
%       (i,1): x location
%       (i,2): y location
%       (i,3): action selected at time i
% Call:
%     [s,t]=CS4300_WW1(5,'CS4300_Example1',b1);
% Author:
%     T. Henderson
%     UU
%     Summer 2015; modified Fall 2016
%

FORWARD = 1;
RIGHT = 2;
LEFT = 3;
GRAB = 4;
SHOOT = 5;
CLIMB = 6;

agent.x = 1;
agent.y = 1;
agent.alive = 1;  
agent.gold = 0;  % grabbed gold in same room
agent.dir = 0;  % facing right
agent.succeed = 0;  % has gold and climbed out
agent.climbed = 0; % climbed out

trace(1).board = board;
trace(1).agent = agent;
trace(1).action = 0;

step = 0;
done = 0;
bumped = 0;
screamed = 0;

score = 0;

while step<max_steps&done==0
    step = step + 1;
    percept = CS4300_get_percept(board,agent,bumped,screamed);
    action = feval(f_name,percept);
    if action==5
        score = score - 50;
    else
        score = score - 1;
    end
    [board,agent,bumped,screamed] = CS4300_update(board,agent,action);
    if agent.alive==0
        score = score - 1000;
    elseif agent.gold==1&agent.x==1&agent.y==1&action==CLIMB
        score = score + 1000;
    end
    trace(step+1).agent = agent;
    trace(step+1).board = board;
    trace(step+1).action = action;
    if agent.alive==0|agent.succeed==1|agent.climbed==1
        done = 1;
    end
end
