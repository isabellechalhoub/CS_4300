function  CS4300_show_tree(nodes,n)
% CS4300_show_tree - display tree structure
% On input:
%     nodes (tree struct): output of DFS or BFS
%     n (int): node to use as root
% On output:
%     prints tree in command window
% Call:
%     CS4300_show_tree(no,1);  % prints complete tree
% Author:
%     T. Henderson
%     UU
%     Summer 2014
%

BLANK = ' ';

if isempty(nodes)
    return
end

level = nodes(n).level;
state = nodes(n).state;
children = nodes(n).children;

white = [];
for p = 1:level
    white = [white,BLANK];
end

fprintf('%s',white);
fprintf('[%d %d %d]\n',state(1),state(2),state(3));

if isempty(children)
    return
end

num_children = length(children);
for c = 1:num_children
    CS4300_show_tree(nodes,children(c));
end
