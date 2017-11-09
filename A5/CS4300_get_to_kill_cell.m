function [ kill ] = CS4300_get_to_kill_cell( agent,wx,wy,safe,board )
%CS4300_GET_TO_KILL_CELL Summary of this function goes here
%   Detailed explanation goes here

row = wy;
col = 4-wx+1;
safest_loc = [1,1,20];
for i=1:4
    if safe(row,i) ~= col && safe(row,i) == 1
        d = sum(abs([agent.x,agent.y]-[row,i]));
        if safest_loc(3) > d
            safest_loc = [row,i,d];
        end
    end
    if safe(i,col) ~= row && safe(i,col) == 1
        d = sum(abs([agent.x,agent.y]-[row,i]));
        if safest_loc(3) > d
            safest_loc = [row,i,d];
        end
    end
end

[so,no] = CS4300_Wumpus_A_star(board,...
    [agent.x,agent.y,agent.dir],...
    [safest_loc(1),safest_loc(2),0],'CS4300_A_star_Man');

kill = [so(2:end,4)];
end

