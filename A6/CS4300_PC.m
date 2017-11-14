function D_revised = CS4300_PC(G,D,P)
% CS4300_PC - a PC function from Mackworth paper 1977
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
%   Dr = CS4300_PC(G,D,?CS4300_P_no_attack?);
% Author:
%   Isabelle Chalhoub
%   UU
%   Fall 2017
%

% Let Y be the set of relational matrices R
% for each pair of labels of i and j
%    check if there is a label for k such that ai,ak is consistent in Rik
%       and aj,ak is consistent in Rjk
%    if there is an inconsistency, remove ai,aj from Rij

n = length(D(:,1));

R = CS4300_relational_matrix_converter(P,D);

for i=1:n+1
    Y(i).R = R;
end

Y(1).R(1,1).R = 1 - Y(1).R(1,1).R;

while ~isequal(Y(n+1),Y(1))
    Y(1).R = Y(n+1).R;
    for k=2:n+1
        for i=1:n
            for j=1:n
                Rij = Y(k-1).R(i,j).R;
                Rik = Y(k-1).R(i,k-1).R;
                Rkk = Y(k-1).R(k-1,k-1).R;
                Rkj = Y(k-1).R(k-1,j).R;
                
                Rij = double(Rij & ((Rik * Rkk * Rkj) > 0));
                Y(k).R(i,j).R = Rij;
            end
        end
    end
end

for i=1:n
    D_revised(i,:) = diag(Y(n+1).R(i,i).R)';
end

end

