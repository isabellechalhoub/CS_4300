function solution = backtrack( start )
%BACKTRACK Summary of this function goes here
%   Detailed explanation goes here

solution = [start.state, start.action];

% This will NOT add the root node (initial_state)
while ~isempty(start.parent)
    start = start.parent;
    solution = [start.state, start.action ; solution];
end

end

