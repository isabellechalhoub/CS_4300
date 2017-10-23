function loc = CS4300_choose1(safe,visited)
% CS4300_choose1 - choose a safe place to go
% On input:
%     safe (4x4 array): 1 if safe, else 0
%     visited (4x4 array): 1 if visited, else 0
% On output:
%     loc (1x2 vector): [x y] location
% Call:
%     loc = CS4300_choose1(safe,visited);
% Author:
%     T. Henderson
%     UU
%     Fall 2015
%

loc = [];
[rows,cols] = find(safe==1&visited==0);

if ~isempty(rows)
    loc = [cols(1),4-rows(1)+1];
end