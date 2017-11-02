function action = CS4300_hybrid_agent(percept)
% CS4300_hybrid_agent - hybrid random and logic-based agent
% On input:
%     percept( 1x5 Boolean vector): percepts
% On output:
%     action (int): action selected by agent
% Call:
%     a = CS4300_hybrid_agent([0,0,0,0,0]);
% Author:
%     T. Henderson
%     UU
%     Fall 2017
%

FORWARD = 1;
RIGHT = 2;
LEFT = 3;
GRAB = 4;
SHOOT = 5;
CLIMB = 6;

persistent safe pits Wumpus board KB have_gold have_arrow risk
persistent agent frontier visited t KB_vars escape travel kill

if isempty(agent)
    t = 0;
    agent.x = 1;
    agent.y = 1;
    agent.dir = 0;
    safe = -ones(4,4);
    pits = -ones(4,4);
    Wumpus = -ones(4,4);
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
    [KBs,KBi,KB_vars] = BR_gen_KB;
    KB = KBi;
    escape = [];
    travel = [];
    kill = [];
    KB(end+1).clauses = [-65];
    KB(end+1).clauses = [-33];
end

if percept(5)==1
    [rW,cW] = find(Wumpus==1);
    board(rW,cW) = 0;
    safe(rW,cW) = 1;
    Wumpus(rW,cW) = 0;
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
    % Update agent's idea of state
    agent = CS4300_agent_update(agent,action);
    visited(4-agent.y+1,agent.x) = 1;
    frontier(4-agent.y+1,agent.x) = 0;
    board(4-agent.y+1,agent.x) = 0;
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

percept_sentence = CS4300_make_percept_sentence(percept,agent.x,agent.y);
KB = CS4300_Tell(KB,percept_sentence);

neighbors = CS4300_neighbors(agent.x,agent.y,safe);
if isempty(neighbors)
    len_neighbors = 0;
else
    len_neighbors = length(neighbors(:,1));
end
for n = 1:len_neighbors
    x = neighbors(n,1);
    y = neighbors(n,2);
    row = 4 - y + 1;
    col = x;
    if ~(visited(row,col)==1|safe(row,col)==1)
        P_index = CS4300_var2index(KB_vars,['P',num2str(x),num2str(y)]);
        thm_nP(1).clauses = [-P_index];
        nPn = CS4300_Ask(KB,thm_nP);
        W_index = CS4300_var2index(KB_vars,['W',num2str(x),num2str(y)]);
        thm_nW(1).clauses = [-W_index];
        nWn = CS4300_Ask(KB,thm_nW);
        if nPn==0
            thm_P(1).clauses = [P_index];
            Pn = CS4300_Ask(KB,thm_P);
        else
            Pn = 0;
        end
        if nWn==0
            thm_W(1).clauses = [W_index];
            Wn = CS4300_Ask(KB,thm_W);
        else
            Wn = 0;
        end
        if nPn==1&nWn==1
            safe(row,col) = 1;
            board(row,col) = 0;
        end
        if nPn==1
            KB = CS4300_Tell(KB,thm_nP);
            pits(row,col) = 0;
        end
        if nWn==1
            KB = CS4300_Tell(KB,thm_nW);
            Wumpus(row,col) = 0;
        end
        if Pn==1
            KB = CS4300_Tell(KB,thm_P);
            pits(row,col) = 1;
        end
        if Wn==1
            KB = CS4300_Tell(KB,thm_W);
            Wumpus(row,col) = 1;
        end
    end
end

% No Wumpus shot yet
[rW,cW] = find(Wumpus==1);
if ~isempty(rW)
    r_kill = [];
    c_kill = [];
    [r_safe,c_safe] = find(safe==1);
    r_index = find(r_safe==rW);
    c_index = find(c_safe==cW);
    if ~isempty(r_index)
        r_kill = r_safe(r_index(1));
        c_kill = c_safe(r_index(1));
        x_kill = c_kill;
        y_kill = 4 - r_kill + 1;
        row_kill = 1;
        col_kill = 0;
    elseif ~isempty(c_index)
        r_kill = r_safe(c_index(1));
        c_kill = c_safe(c_index(1));
        x_kill = c_kill;
        y_kill = 4 - r_kill + 1;
        col_kill = 1;
        row_kill = 0;
    end
    if ~isempty(r_kill)
        if x_kill==agent.x&y_kill==agent.y
            final_dir = agent.dir;
        else
            [so,no] = CS4300_Wumpus_A_star(abs(board),...
                [agent.x,agent.y,agent.dir],...
                [x_kill,y_kill,0],'CS4300_A_star_Man');
            kill = so(2:end,4);  % gets agent to right place
            final_dir = so(end,3);
        end
        if row_kill==1
            if cW>c_kill
                if final_dir==1
                    kill = [kill;2];
                elseif final_dir==2
                    kill = [kill;2;2];
                elseif final_dir==3
                    kill = [kill;3];
                end
            else
                if final_dir==0
                    kill = [kill;2;2];
                elseif final_dir==1
                    kill = [kill;3];
                elseif final_dir==3
                    kill = [kill;2];
                end
            end
        else
            if rW>r_kill
                if final_dir==0
                    kill = [kill;3];
                elseif final_dir==1
                    kill = [kill;2;2];
                elseif final_dir==2
                    kill = [kill;3];
                end
            else
                if final_dir==0
                    kill = [kill;3];
                elseif final_dir==2
                    kill = [kill;2];
                elseif final_dir==3
                    kill = [kill;2;2];
                end
            end
        end
        kill = [kill;5];
    end
    action = kill(1);
    kill = kill(2:end);
    % Update agent's idea of state
    agent = CS4300_agent_update(agent,action);
    visited(4-agent.y+1,agent.x) = 1;
    frontier(4-agent.y+1,agent.x) = 0;
    board(4-agent.y+1,agent.x) = 0;
    return
end

if isempty(travel)
    [cand_rows,cand_cols] = find(safe==1&visited==0);
    if ~isempty(cand_rows)
        cand_x = cand_cols;
        cand_y = 4 - cand_rows + 1;
        [so,no] = CS4300_Wumpus_A_star(abs(board),...
            [agent.x,agent.y,agent.dir],...
            [cand_x(1),cand_y(1),0],'CS4300_A_star_Man');
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

% Take a risk
if isempty(escape)&isempty(travel)&isempty(risk)&isempty(kill)
    [cand_row,cand_col] = CS4300_frontier(visited);
    cand_x = cand_col;
    cand_y = 4 - cand_row + 1;
    indexes = find(cand_x~=agent.x|cand_y~=agent.y);
    if ~isempty(indexes)
        goal_x = cand_x(indexes(1));
        goal_y = cand_y(indexes(1));
    end
    temp_board = board;
    temp_board(4-goal_y+1,goal_x) = 0;
    [so,no] = CS4300_Wumpus_A_star(abs(temp_board),...
        [agent.x,agent.y,agent.dir],...
        [goal_x,goal_y,0],'CS4300_A_star_Man');
    if ~isempty(so)
        risk = [so(2:end,4)];
    else
        risk = randi(3);
    end
    action = risk(1);
    risk = risk(2:end);
    % Update agent's idea of state
    agent = CS4300_agent_update(agent,action);
    visited(4-agent.y+1,agent.x) = 1;
    frontier(4-agent.y+1,agent.x) = 0;
    board(4-agent.y+1,agent.x) = 0;
    return
end

tch = 0;