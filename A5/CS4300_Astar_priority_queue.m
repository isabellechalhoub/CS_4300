function queue_out = CS4300_Astar_priority_queue(next_list,queue,nodes)
% CS4300_Astar_priority_queue - priority queue for A* algorithm
% On input:
%     next_list (1xk vector): list of indexes of nodes to be inserted
%     queue (1xn vector): prioritized list of nodes
%     nodes (search tree data structure): search tree nodes
% On output:
%     queue_out (1x(n+k) vector): queue with next_list indexes inserted
% Call:
%     qo = CS4300_Astar_priority_queue(nl,q,nodes);
% Author:
%     T. Henderson
%     UU
%     Fall 2015, modified Summer 2016
%

if isempty(next_list)
    queue_out = queue;
    return
end

queue1 = [next_list,queue];
len_queue1 = length(queue1);
costs = zeros(len_queue1,1);
for n = 1:len_queue1
    costs(n) = nodes(queue1(n)).cost;
end
[vals,indexes] = sort(costs);
queue_out = queue1(indexes);
