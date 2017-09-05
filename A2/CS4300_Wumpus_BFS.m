function [solution,nodes]  = CS4300_Wumpus_BFS(board,initial_state,...
    goal_state)
% CS4300_Wumpus_BFS - breadth-first search in Wumpus world
% On input:
%     board (4x array): Wumpus board
%       (0: empty; 1: pit; 2: gold; 3: Wumpus; 4: Gold/Wumpus
% On output:
%     solution (nx4 array): each row is state and previous action
%     nodes (vector struct): node information
%       .parent
%       .level
%       .state
%       .action
%       .cost
%       .children
% Call:
%     [so,no] = CS4300_Wumpus_BFS([0,0,0,3;1,0,0,0;0,2,0,0;0,1,0,0],...
%           [1,1,0],[2,2,0])
% Author:
%     T. Henderson
%     UU
%     Summer 2014
%

nodes(1).parent = [];
nodes(1).level = 0;
nodes(1).state = initial_state;
nodes(1).action = 0;
nodes(1).cost = 0;
nodes(1).children = [];
num_nodes = 1;
frontier = [1];
explored = [];
while 1==1
    if isempty(frontier)
        solution = [];
        return
    end
    node = frontier(1);
    frontier = frontier(2:end);
    explored = [explored,node];
    next_list = [];
    for action = 1:3
        next_state = CS4300_Wumpus_transition(nodes(node).state,...
            action,board);
        if next_state(1)>0 ...
            & CS4300_Wumpus_new_state(next_state,frontier,explored,...
                nodes)
            num_nodes = num_nodes + 1;
            nodes(num_nodes).parent = node;
            nodes(num_nodes).level = nodes(node).level + 1;
            nodes(num_nodes).state = next_state;
            nodes(num_nodes).action = action;
            nodes(num_nodes).cost = nodes(node).cost + 1;
            nodes(num_nodes).children = [];
            nodes(node).children = [nodes(node).children,num_nodes];
            if CS4300_Wumpus_solution(board,next_state,goal_state)
                solution = CS4300_traceback(nodes,num_nodes);
                return
            end
            next_list = [next_list,num_nodes];
        end
    end
    frontier = [frontier,next_list];
end
