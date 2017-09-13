function new_list = CS4300_sort_by_cost( old_list, nodes )
% CS4300_sort_by_cost - Prioritize unvisited list by projected cost
%   Sorts the unvisited list for A* by the f value for the nodes in the
%   list
% On input:
%   old_list (1xn int vector): The old list of indeces to visit next
%       Each index is used to reference a node in the nodes list
%   nodes (n sized node vector): Vector of node structs
% On output:
%   new_list (1xn int vector): The sorted version of the old index list
% Call:
%   unvisited = CS4300_A2_driver(unvisited, nodes);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017%

s = size(old_list, 2);
sorting_matrix = zeros(s, 2);

for index=1:s
    sorting_matrix(index, 1) = old_list(index);
    sorting_matrix(index, 2) = nodes(old_list(index)).cost;
end

sorted = sortrows(sorting_matrix, 2);
new_list = sorted(:,1);
new_list = new_list';

end

