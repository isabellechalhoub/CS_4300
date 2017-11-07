function trace = CS4300_traceback(nodes,n)
% CS4300_traceback - trace back to initial state from goal state
% On input:
%     nodes (nodes data structure): nodes of search tree
%      (i).parent (int): index of parent node
%         .state (1x3 vector): [x,y,d]
%         .action (int): action which led to this state
%             1: FORWARD
%             2: ROTATE RIGHT
%             3: ROTATE LEFT
%             4: GRAB
%             5: SHOOT
%             6: CLIMB
%         .cost (int): cost from start to this node
%         .children (vector): list of children's node indexes
%     n (int): index of goal node
% On outpur:
%     trace (kx4 array): trace from start to goal
%      col. 1: x coordinate
%      col. 2: y coordinate
%      col. 3: direction
%         0: facing right
%         1: facing up
%         2: facing left
%         3: facing down
%      col. 4: action taken to get to this state
% Call:
%     t = CS4300_traceback(nodes,10);
% Author:
%     T. Henderson
%     UU
%     Summer 2015
%

trace = [nodes(n).state,nodes(n).action];
b = n;
while b>0
    b = nodes(b).parent;
    trace = [nodes(b).state,nodes(b).action;trace];
end
