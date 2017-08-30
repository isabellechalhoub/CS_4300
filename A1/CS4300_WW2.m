function trace = CS4300_WW2(max_steps,f_name)
% CS4300_WW2 - Wumpus World 2 simulator
% On input:
%     max_steps (int): maximum number of simulation steps
%     f_name (string): name of agent function
% On output:
%     trace (nx3 int array): trace of state
%       (i,1): x location
%       (i,2): y location
%       (i,3): action selected at time i
% Call:
%     t = CS4300_WW1(50,'CS4300_Example2');
% Author:
%     T. Henderson
%     UU
%     Summer 2015
%

agent.x = 1;
agent.y = 1;
agent.alive = 1;  
agent.gold = 0;  % grabbed gold in same room
agent.dir = 0;  % facing right
agent.succeed = 0;  % has gold and climbed out
agent.climbed = 0; % climbed out

board = [0,4,1,0;0,0,0,1;0,1,0,0;0,0,0,1];
trace = CS4300_WW1(max_steps,f_name,board);
