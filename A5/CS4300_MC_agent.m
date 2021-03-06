function action = CS4300_MC_agent(percept)
% CS4300_MC_agent - Monte Carlo agent with a few informal rules
% On input:
%   percept (1x5 Boolean vector): percept from Wumpus world
%       (1): stench
%       (2): breeze
%       (3): glitter
%       (4): bump
%       (5): scream
% On output:
%   action (int): action to take
%       1: FORWARD
%       2: RIGHT
%       3: LEFT
%       4: GRAB
%       5: SHOOT
%       6: CLIMB
% Call:
%   a = CS4300_MC_agent(percept);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   UU
%   Fall 2017
%

FORWARD = 1;
RIGHT = 2;
LEFT = 3;
GRAB = 4;
SHOOT = 5;
CLIMB = 6;

persistent safe pits Wumpus breezes stench board have_gold have_arrow risk;
persistent agent frontier visited t escape travel kill wump_alive wump_loc;

if isempty(agent)
    t = 0;
    agent.x = 1;
    agent.y = 1;
    agent.dir = 0;
    safe = -ones(4,4);
    pits = -ones(4,4);
    Wumpus = -ones(4,4);
    breezes = -ones(4,4);
    stench = -ones(4,4);
    board = -ones(4,4);
    visited = zeros(4,4);
    frontier = zeros(4,4);
    safe(4,1) = 1;
    pits(4,1) = 0;
    Wumpus(4,1) = 0;
    board(4,1) = 0;
    visited(4,1) = 1;
    have_gold = 0;
    have_arrow = 1;
    escape = [];
    travel = [];
    kill = [];
    wump_alive = 1;
    wump_loc = [];
end

if percept(5)==1
    [rW,cW] = find(Wumpus==1);
    wump_loc = [rW,cW];
    board(rW,cW) = 0;
    safe(rW,cW) = 1;
    Wumpus(rW,cW) = 0;
    pits(rW,cW) = 0;
    wump_alive = 0;
    stench = zeros(4,4);
end

if ~isempty(escape)
    action = escape(1);
    escape = escape(2:end);
    % Update agent's idea of state
    agent = CS4300_agent_update(agent,action);
    visited(4-agent.y+1,agent.x) = 1;
    frontier(4-agent.y+1,agent.x) = 0;
    board(4-agent.y+1,agent.x) = 0;
    return
end

if ~isempty(travel)
    action = travel(1);
    travel = travel(2:end);
    % Update agent's idea of state
    agent = CS4300_agent_update(agent,action);
    visited(4-agent.y+1,agent.x) = 1;
    frontier(4-agent.y+1,agent.x) = 0;
    board(4-agent.y+1,agent.x) = 0;
    safe(4-agent.y+1,agent.x) = 1;
    pits(4-agent.y+1,agent.x) = 0;
    Wumpus(4-agent.y+1,agent.x) = 0;
    return
end

if ~isempty(risk)
    action = risk(1);
    risk = risk(2:end);
    % Update agent's idea of state
    agent = CS4300_agent_update(agent,action);
    visited(4-agent.y+1,agent.x) = 1;
    frontier(4-agent.y+1,agent.x) = 0;
    board(4-agent.y+1,agent.x) = 0;
    return
end

if ~isempty(kill)
    action = kill(1);
    kill = kill(2:end);
    if action == 5
        have_arrow = 0;
    end
    % Update agent's idea of state
    agent = CS4300_agent_update(agent,action);
    visited(4-agent.y+1,agent.x) = 1;
    frontier(4-agent.y+1,agent.x) = 0;
    board(4-agent.y+1,agent.x) = 0;
    safe(4-agent.y+1,agent.x) = 1;
    pits(4-agent.y+1,agent.x) = 0;
    Wumpus(4-agent.y+1,agent.x) = 0;
    return
end

if have_gold==0&percept(3)==1
    escape = [GRAB];
    have_gold = 1;
    [so,no] = CS4300_Wumpus_A_star(abs(board),...
        [agent.x,agent.y,agent.dir],...
        [1,1,0],'CS4300_A_star_Man');
    escape = [escape;so(2:end,4)];
    escape = [escape;CLIMB];
    action = escape(1);
    escape = escape(2:end);
    % Update agent's idea of state
    agent = CS4300_agent_update(agent,action);
    visited(4-agent.y+1,agent.x) = 1;
    frontier(4-agent.y+1,agent.x) = 0;
    board(4-agent.y+1,agent.x) = 0;
    return
end

% Update boards with percept info:

% Wumpus stuff:
if wump_alive == 1
    if percept(1) == 1
        stench(4-agent.y+1,agent.x) = 1;
        Wumpus = CS4300_Wumpus_Neighbor_Clear(Wumpus, agent.x, agent.y);
    else
        stench(4-agent.y+1,agent.x) = 0;
        neis = BR_Wumpus_neighbors(agent.x, agent.y);
        for i=1:length(neis)
            Wumpus(4-neis(i,2)+1,neis(i,1)) = 0;
        end
    end
end

% Pit stuff:
if percept(2) == 1
    breezes(4-agent.y+1,agent.x) = 1;
else
    breezes(4-agent.y+1,agent.x) = 0;
    neis = BR_Wumpus_neighbors(agent.x, agent.y);
    for i=1:length(neis)
        pits(4-neis(i,2)+1,neis(i,1)) = 0;
    end
end

% Safe stuff:
if percept(1) == 0 && percept(2) == 0
    neis = BR_Wumpus_neighbors(agent.x, agent.y);
    for i=1:length(neis)
        safe(4-neis(i,2)+1,neis(i,1)) = 1;
    end
end

% Update probability boards:
[pit_prob,wumpus_prob] = CS4300_WP_estimates(breezes,stench,100);

if wump_alive == 0
    pits(wump_loc(1),wump_loc(2)) = 0;
    pit_prob(wump_loc(1),wump_loc(2)) = 0;
    wumpus_prob(wump_loc(1),wump_loc(2)) = 0;
end

[px,py] = find(pit_prob==1);
if ~isempty(px)
    pits(px,py) = 1;
    safe(px,py) = 0;
    Wumpus(px,py) = 0;
end

[wx,wy] = find(wumpus_prob==1);
if ~isempty(wx)
    visited(wx,wy) = 1;
    Wumpus(wx,wy) = 1;
    safe(wx,wy) = 0;
    pits(wx,wy) = 0;
end

unsafe_board = max(pit_prob, wumpus_prob);

% shoot wumpus if wumpus location is known (or threshold?)
[wx, wy] = find(Wumpus==1);
if ~isempty(wx)  && have_arrow == 1
    kill = CS4300_make_kill_plan(agent,wx,wy);
    action = kill(1);
    if action == 5
        have_arrow = 0;
    end
    kill = kill(2:end);
    % Update agent?s idea of state
    agent = CS4300_agent_update(agent,action);
    visited(4-agent.y+1,agent.x) = 1;
    frontier(4-agent.y+1,agent.x) = 0;
    board(4-agent.y+1,agent.x) = 0;
    return
end
    
%pick the safest unvisited neighbor if Wumpus unknown
if isempty(kill)
    safest_nei = CS4300_Find_Safest_Neighbor(unsafe_board, agent.x, agent.y, visited);
    if safest_nei > 0
        [so,no] = CS4300_Wumpus_A_star(board,...
            [agent.x,agent.y,agent.dir],...
            [safest_nei(1),safest_nei(2),0],'CS4300_A_star_Man');
        travel = [so(2:end,4)];
        action = travel(1);
        travel = travel(2:end);
        % Update agent's idea of state
        agent = CS4300_agent_update(agent,action);
        visited(4-agent.y+1,agent.x) = 1;
        frontier(4-agent.y+1,agent.x) = 0;
        board(4-agent.y+1,agent.x) = 0;
        return
    end
end

if isempty(travel) && isempty(kill)
    safest_cell = CS4300_find_safest_unvisited(unsafe_board,visited);
    if (safest_cell(1) ~= -1)
        temp = board(4-safest_cell(2)+1,safest_cell(1));
        board(4-safest_cell(2)+1,safest_cell(1)) = 0;
        [so,no] = CS4300_Wumpus_A_star(board,...
            [agent.x,agent.y,agent.dir],...
            [safest_cell(1),safest_cell(2),0],'CS4300_A_star_Man');
        board(4-safest_cell(2)+1,safest_cell(1)) = temp;
        travel = [so(2:end,4)];
        action = travel(1);
        travel = travel(2:end);
        % Update agent's idea of state
        agent = CS4300_agent_update(agent,action);
        visited(4-agent.y+1,agent.x) = 1;
        frontier(4-agent.y+1,agent.x) = 0;
        board(4-agent.y+1,agent.x) = 0;
        return
    % We have visited everything so we should either kill or go home
    else
        [rW,cW] = find(Wumpus==1);
        if wump_alive == 1 && ~isempty(rW) && have_arrow == 1
            % try to kill the wumpus
            kill = CS4300_make_kill_plan(agent,rW,cW);
            action = kill(1);
            if action == 5
                have_arrow = 0;
            end
            kill = kill(2:end);
            % Update agent?s idea of state
            agent = CS4300_agent_update(agent,action);
            visited(4-agent.y+1,agent.x) = 1;
            frontier(4-agent.y+1,agent.x) = 0;
            board(4-agent.y+1,agent.x) = 0;
            return
        else
            % go home
            [so,no] = CS4300_Wumpus_A_star(board,...
                [agent.x,agent.y,agent.dir],...
                [1,1,0],'CS4300_A_star_Man');
            travel = [so(2:end,4)];
            travel = [travel;CLIMB];
            action = travel(1);
            travel = travel(2:end);
            % Update agent's idea of state
            agent = CS4300_agent_update(agent,action);
            visited(4-agent.y+1,agent.x) = 1;
            frontier(4-agent.y+1,agent.x) = 0;
            board(4-agent.y+1,agent.x) = 0;
            return
        end
    end
end