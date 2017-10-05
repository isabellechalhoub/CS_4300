function [scores,traces] = CS4300_WW32(max_steps,f_name)
% CS4300_WW3 - Wumpus World 3 (hybrid agent) simulator
% On input:
%     max_steps (int): maximum number of simulation steps
%     f_name (string): name of agent function
% On output:
%     score (int): agent score on game
%     trace (nx3 int array): trace of state
%       (i,1): x location
%       (i,2): y location
%       (i,3): action selected at time i
% Call:
%     [s,t] = CS4300_WW3(50,'CS4300_hybrid_agent');
% Author:
%     T. Henderson
%     UU
%     Summer 2015
%

traces = [];

agent.x = 1;
agent.y = 1;
agent.alive = 1;  
agent.gold = 0;  % grabbed gold in same room
agent.dir = 0;  % facing right
agent.succeed = 0;  % has gold and climbed out
agent.climbed = 0; % climbed out

clear(f_name);

board1 = [0,0,0,3;...
    0,0,0,0;...
    2,1,0,0;...
    0,0,0,0];
[score,trace] = CS4300_WW1(max_steps,f_name,board1);
scores(1).board = board1;
scores(1).score = score;
scores(1).trace = trace;

clear(f_name);

board2 = [0,0,0,1;...
    3,2,1,0;...
    0,0,0,0;...
    0,0,1,0];
[score,trace] = CS4300_WW1(max_steps,f_name,board2);
scores(2).board = board2;
scores(2).score = score;
scores(2).trace = trace;

clear(f_name);

board3 = [0,0,0,0;...
    0,0,0,0;...
    3,2,0,0;...
    0,1,0,0];
[score,trace] = CS4300_WW1(max_steps,f_name,board3);
scores(3).board = board3;
scores(3).score = score;
scores(3).trace = trace;
