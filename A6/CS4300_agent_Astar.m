function action = CS4300_agent_Astar(percept)
% CS4300_agent_Astar - A* search agent example
%   Uses A* to find best path back to start
% On input:
%   percept (1x5 Boolean vector): percept values
%       (1): Stench
%       (2): Breeze
%       (3): Glitters
%       (4): Bumped
%       (5): Screamed
% On output:
%   action (int): action selected by agent
%       FORWARD = 1;
%       ROTATE_RIGHT = 2;
%       ROTATE_LEFT = 3;
%       GRAB = 4;
%       SHOOT = 5;
%       CLIMB = 6;
% Call:
%   a = CS4300_agent_Astar([0,0,0,0,0]);
% Author:
%   Isabelle Chalhoub
%   UU
%   Fall 2017
%

GRAB = 4;
CLIMB = 6;

persistent t go_home board agent have_gold;

if isempty(t)
    t = 1;
    go_home = [];
    board = -ones(4,4);
    board(4,1) = 0;
    agent.x = 1;
    agent.y = 1;
    agent.dir = 0;
    have_gold = 0;
end

if ~isempty(go_home)
    action = go_home(1);
    go_home = go_home(2:end);
    agent = CS4300_agent_update(agent,action);
    return;
end

if percept(3) == 1 && ~have_gold
    have_gold = 1;
    board(5-agent.y,agent.x) = 2;
    
    go_home = [GRAB];
    [so,no] = CS4300_Wumpus_A_star(abs(board),...
        [agent.x,agent.y,agent.dir],...
        [1,1,0],'CS4300_A_star_Man');
    go_home = [go_home;so(2:end,4)];
    go_home = [go_home;CLIMB];
    
    action = go_home(1);
    go_home = go_home(2:end);
else
    board(5-agent.y,agent.x) = 0;
end

if isempty(go_home)
    action = ceil((3)*rand(1));
end

agent = CS4300_agent_update(agent,action);

end

