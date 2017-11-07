function b = CS4300_Wumpus_solution(board,state,goal)
% CS4300_Wumpus_solution - determine if state is solution
% On input:
%     board (4x4 array): Wumpus board
%     state (1x3 vector): [x,y,d]
%     goal (1x3 vector): [x,y,gold]
%        x,y: x,y coords to achive (if >0)
%        gold: 1 if need to be in gold cell
% On output:
%     b (Boolean): 0 if not solution, else 1
% Call:
%     t = CS4300_Wumpus_solution(b,[1,1,2],[1,1,0]);
% Author:
%     T. Henderson
%     UU
%     Summer 2015
%

GOLD = 2;

b = 0;
x = state(1);
y = state(2);
r = 4 - y + 1;
c = x;

xg = goal(1);
yg = goal(2);
gold = goal(3);

if gold==1&board(r,c)==GOLD
    b = 1;
    return
elseif x==xg&y==yg
    b = 1;
    return
end
