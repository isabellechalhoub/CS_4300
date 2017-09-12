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
nodes(1).h = 1;  %% How do you do heuristic????
nodes(1).cost = nodes(1).g + nodes(1).h;
nodes(1).children = [];

% Create visited and unvisited lists. Add root to unvisited
% These lists hold indeces to the nodes list
visited = [];
unvisited = [];
unvisited(1) = nodes(1);   % Add the root to unvisited list

% Loop:
while true
%   pop node off unvisited list, add it to visited list
    n = unvisited(1);
    unvisited = unvisited([2:end]);
    visited = [visited, n];
%   if we are at the solution - return
    if n.state(1) == goal_state(1) && n.state(2) == goal_state(2)
        solution = backtrack(nodes, n);
        return
    end
    % Add forward, right, and left children
    for i=1:3
        length = size(nodes);
        length = length + 1;

        nodes(length).parent = n;
        nodes(length).level = n.level + 1;
        nodes(length).state = update_location(i, n.state(1), n.state(2), n.state(3));
        nodes(length).action = i;
        nodes(length).g = n.g + 1;
        nodes(length).h = 1; %%%%%% HEURISTIC
        nodes(length).cost = nodes(length).g + nodes(length).h;
        nodes(length).children = [];

        n.children = [children, nodes(length)];

        unvisited = insert(unvisited, nodes(length), nodes);
    end
    % Sort univisted list for next iteration - sort by cost val
end

end
