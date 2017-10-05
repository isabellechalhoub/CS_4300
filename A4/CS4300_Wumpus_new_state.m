function b = CS4300_Wumpus_new_state(state,frontier,explored,nodes)
% CS4300_Wumpus_new_state - determine if state is already in search tree
% On input:
%     state (1x3 vector): [x,y,dir] agent state
%     frontier (vector): indexes of nodes on frontier
%     explored (vector): indexes of nodes in interior
%     nodes (search tree data structure): search tree 
% On output:
%     b (Boolean): 1 if new state, else 0
% Call:
%     b = CS4300_Wumpus_new_state(s,OPEN,CLOSED,nodes);
% Author:
%     T. Henderson
%     UU
%     Fall 2015
%

b = 1;
 
x = state(1);
y = state(2);
d = state(3);
if ~isempty(frontier)
    num_frontier = length(frontier);
    for f = 1:num_frontier
        f_state = nodes(frontier(f)).state;
        if f_state(1)==x&f_state(2)==y&f_state(3)==d
            b = 0;
            return
        end
    end
end
if ~isempty(explored)
    num_explored = length(explored);
    for e = 1:num_explored
        e_state = nodes(explored(e)).state;
        if e_state(1)==x&e_state(2)==y&e_state(3)==d
            b = 0;
            return
        end
    end
end
