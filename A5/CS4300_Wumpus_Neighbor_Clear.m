function [ wumpus_board_out ] = CS4300_Wumpus_Neighbor_Clear( wumpus_board,...
    agent_loc_x, agent_loc_y )
%CS4300_WUMPUS_NEIGHBOR_CLEAR - Clears out all non-neighbors of a stench
% On input:
%       wumpus_board (4x4 matrix): whether the wumpus is in any of the
%           represented cells
%       agent_loc_x (int): the x coordinate for the agent
%       agent_loc_y (int): the y coordinate for the agent
% On output:
%       wumpus_board_out (4x4 matrix): the updated state of each cell to
%           represent the wumpus
% Call:
%   a = CS4300_Wumpus_Neighbor_Clear(wumpus_board, agent_loc_x, agent_loc_y);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   UU
%   Fall 2017
%

wumpus_board_out = zeros(4,4);
agent_neis = BR_Wumpus_neighbors(agent_loc_x, agent_loc_y);

for i=1:length(agent_neis)
    wumpus_board_out(4-agent_neis(i,2)+1, agent_neis(i,1)) = wumpus_board(...
        4-agent_neis(i,2)+1, agent_neis(i,1));
end


end

