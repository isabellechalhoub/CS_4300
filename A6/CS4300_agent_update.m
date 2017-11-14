function [ agent_out ] = CS4300_agent_update( agent, action )

agent_out = agent;

switch action
    % FORWARD
    case 1
        if agent.dir == 0 && agent.x < 4
            agent_out.x = agent.x + 1;
        elseif agent.dir == 1 && agent.y < 4
            agent_out.y = agent.y + 1;
        elseif agent.dir == 2 && agent.x > 1
            agent_out.x = agent.x - 1;
        elseif agent.dir == 3 && agent.y > 1
            agent_out.y = agent.y - 1;
        end
    % RIGHT
    case 2
        if agent.dir == 0
            agent_out.dir = 3;
        else
            agent_out.dir = agent.dir - 1;
        end
    % LEFT
    case 3
        if agent.dir == 3
            agent_out.dir = 0;
        else
            agent_out.dir = agent.dir + 1;
        end
    % GRAB
    case 4
    % SHOOT
    case 5
    % CLIMB
    case 6
end

end

