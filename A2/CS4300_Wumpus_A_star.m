function [solution,nodes] = CS4300_Wumpus_A_star(board,initial_state,goal_state,h_name)
% CS4300_Wumpus_A_star - A* algorithm for Wumpus world
% On input:
%   board (4x4 int array): Wumpus board layout
%       0: means empty cell
%       1: means a pit in cell
%       2: means gold (only) in cell
%       3: means Wumpus (only) in cell
%       4: means gold and Wumpus in cell
%   initial_state (1x3 vector): x,y,dir state
%   goal_state (1x3 vector): x,y,dir state
%   h_name (string): name of heuristic function
% On output:
%   solution (nx4 array): solution sequence of state and the action
%   nodes (search tree data structure): search tree
%       (i).parent (int): index of node's parent
%       (i).level (int): level of node in search tree
%       (i).state (1x3 vector): [x,y,dir] state represented by node
%       (i).action (int): action along edge from parent to node
%       (i).g (int): path length from root to node
%       (i).h (float): heuristic value (estimate from node to goal)
%       (i).cost (float): g + h (called f value in text)
%       (i).children (1xk vector): list of node's children
% Call:
% [so,no] = CS4300_Wumpus_A_star([0,0,0,0;0,0,0,1;0,2,1,3;0,0,0,0],...
%           [1,1,0],[2,2,1],?CS4300_A_star_Man?)
% so =
%   1 1 0 0
%   2 1 0 1
%   2 1 1 3
%   2 2 1 1
%
% no = 1x9 struct array with fields:
%   parent
%   level
%   state
%   action
%   cost
%   g
%   h
%   children
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017


% First initialize the nodes search tree with a single node - our initial state
nodes(1).parent = [];
nodes(1).level = 1;
nodes(1).state = initial_state;
nodes(1).action = 0;
nodes(1).g = 0;
nodes(1).h = feval(h_name, 1, 1, nodes(1).state(1), nodes(1).state(2));
nodes(1).cost = 0;
nodes(1).children = [];
num_nodes = 1;
% Create visited and unvisited lists. Add root to unvisited
% These lists hold indeces to the nodes list
visited = [];
unvisited = [1];

% Loop:
while true
    if isempty(unvisited)
        solution = [];
        return
    end
    
%   pop node off unvisited list, add it to visited list
    n = unvisited(1);
    unvisited = unvisited([2:end]);
    visited = [visited, n];
    next_list = [];
    
    if CS4300_Wumpus_solution(board, nodes(n).state, goal_state)
        solution = CS4300_traceback(nodes,n);
        return
    end
    
    % Add forward, right, and left children
    for action=1:3
        next_state = CS4300_Wumpus_transition(nodes(n).state,...
            action,board);
        if next_state(1)>0 ...
            & CS4300_Wumpus_new_state(next_state,unvisited,visited,...
                nodes)
            num_nodes = num_nodes + 1;
            nodes(num_nodes).parent = n;
            nodes(num_nodes).level = nodes(n).level + 1;
            nodes(num_nodes).state = next_state;
            nodes(num_nodes).action = action;
            nodes(num_nodes).g = nodes(n).g + 1;
            nodes(num_nodes).h = feval(h_name, 1, 1, nodes(n).state(1), nodes(n).state(2));
            nodes(num_nodes).f = nodes(num_nodes).g + nodes(num_nodes).h;
            nodes(num_nodes).cost = nodes(n).cost + 1;
            nodes(num_nodes).children = [];
            nodes(n).children = [nodes(n).children,num_nodes];
       
            next_list = [next_list, num_nodes];
        end
    end
    % Sort univisted list for next iteration - sort by cost val
    % Order by cost column - take node column as new unvisited.
    % sortrows(matrix, row u wanna sort by) or sort columns
    unvisited = CS4300_sort_by_cost([unvisited,next_list], nodes);
    %unvisited = sortrows(unvisited, nodes.cost);
end

end
