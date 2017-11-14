function [R] = CS4300_relational_matrix_converter(P, D)
% CS4300_relational_matrix_converter - Converts the relational function and
%   our set of labels into a set of relational matrices
% On input:
%   P (string): predicate function name; P(i,a,j,b) takes as
%   arguments:
%       i (int): start node index
%       a (int): start node domain value
%       j (int): end node index
%       b (int): end node domain value
%   D (nxm array): m domain values for each of n nodes
% On output:
%   R (4x4 struct) : Relational matrix for each relation: R(i,a,j,b)
% Call:
%   R = CS4300_relational_matrix_converter(P,D);
% Author:
%   Isabelle Chalhoub
%   UU
%   Fall 2017
%

num_nodes = size(D,1);
num_labels = size(D,2);

for i=1:num_nodes
    for j=1:num_nodes
        R(i,j).R = zeros(num_labels,num_labels);
    end
end

for i=1:num_nodes
    for j=1:num_nodes
        for a=1:num_labels
            for b=1:num_labels
                R(i,j).R(a,b) = feval(P,i,a,j,b);
            end
        end
    end
end

for i=1:num_nodes
    for a=1:num_labels
        if D(i,a) == 0
            R(i,i).R(a,a) = 0;
        end
    end
end

end

