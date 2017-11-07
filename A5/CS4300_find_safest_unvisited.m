function [ safest_cell ] = CS4300_find_safest_unvisited(unsafe_board, ...
    visited)
%CS4300_find_safest_unvisited - Finds the smallest probability of danger in
%       unvisited cells on the board
% On input:
%   unsafe_board (4x4 matrix): a board of probabilities representing the
%       danger percentage in each cell
%   visited (4x4 matrix) : a board of visited/unvisited cells
% On output:
%   safest_cell(1x2 vector): the safest unvisited cell
% Call:
%   a = CS4300_find_safest_unvisited;
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   UU
%   Fall 2017
%

cells = [1,2;1,3;1,4;2,1;2,2;2,3;2,4;3,1;3,2;3,3;3,4;4,1;4,2;4,3;4,4];

current_low = 1;

for i=1:15
    if visited(4-cells(i,2)+1, cells(i,1)) ~= 1
        if current_low > unsafe_board(4-cells(i,2)+1, cells(i, 1))
            current_low = unsafe_board(4-cells(i,2)+1, cells(i, 1));
            safest_cell = cells(i,:);
        end
    end
end
end

