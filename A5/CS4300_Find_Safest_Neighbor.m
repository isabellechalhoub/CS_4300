function [ safest_neighbor ] = CS4300_Find_Safest_Neighbor( unsafe_board, ...
    agent_x, agent_y, visited)
%CS4300_FIND_SAFEST_NEIGHBOR - Finds the smallest probability of danger in
%       unvisited neighbors to the agent
% On input:
%   unsafe_board (4x4 matrix): a board of probabilities representing the
%       danger percentage in each cell
%   agent_x (int): the x coordinate of the agent
%   agent_y (int): the y coordinate of the agent
%   visited (4x4 matrix) : a board of visited/unvisited cells
% On output:
%   safest_neighbor(1x2 vector): the safest neighbor to the agent
%       *if there is a tie, it uses the first neighbor it discovered
% Call:
%   a = CS4300_Find_Safest_Neighbor;
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   UU
%   Fall 2017
%

agent_neis = BR_Wumpus_neighbors(agent_x, agent_y);
current_low = 0.2;

for i=1:length(agent_neis)
    if visited(4-agent_neis(i,2)+1, agent_neis(i,1)) ~= 1
        if current_low > unsafe_board(4-agent_neis(i,2)+1, agent_neis(i,1))
            current_low = unsafe_board(4-agent_neis(i,2)+1, agent_neis(i,1));
            safest_neighbor = agent_neis(i,:);
        end
    end
end
if current_low == 0.2
    safest_neighbor = [-1,-1];
end
end

