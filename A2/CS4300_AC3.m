function D_revised = CS4300_AC3(G,D,P)
% CS4300_AC3 - AC3 function from Mackworth paper 1977
% On input:
%   G (nxn array): neighborhood graph for n nodes
%   D (nxm array): m domain values for each of n nodes
%   P (string): predicate function name; P(i,a,j,b) takes as
%   arguments:
%       i (int): start node index
%       a (int): start node domain value
%       j (int): end node index
%       b (int): end node domain value
% On output:
%   D_revised (nxm array): revised domain labels
% Call:
%   G = 1 - eye(3,3);
%   D = [1,1,1;1,1,1;1,1,1];
%   Dr = CS4300_AC3(G,D,?CS4300_P_no_attack?);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017
%

arc_queue = [];
% generate the initial domains
for d_index=1:size(D,1)
    if D(d_index, 1) == 1 && D(d_index, 2) == 0 && D(d_index, 3) == 0
        arc_queue = CS4300_domain_finder(arc_queue, G, d_index);
    end
end
D_revised = D;

while ~isempty(arc_queue)
%revise all the arcs that could be affected
    D_revised = CS4300_revise(arc_queue(1,:), D, P);
    %add the children of a revised node
    if D_revised ~= D
        temp = arc_queue(1);
        arc_queue = CS4300_domain_finder(arc_queue, G, temp);
    end

    %remove the revised node
    if size(arc_queue) > 1
            arc_queue = arc_queue(2:end);
    else
        arc_queue = [];
    end
end

end

