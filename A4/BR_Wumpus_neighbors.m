function neis = BR_Wumpus_neighbors(x,y)
% BR_Wumpus_neighbors - generate list of neighbors in grid
% On input:
%     x (int): x location
%     y (int): y location
% On output:
%     neis (kx2 array): xn,yn pairs for neighbors
% Call:
%     neis = BR_Wumpus_neighbors(1,1);
% Author:
%     T. Henderson
%     UU
%     Summer 2017
%

neis = [];
for xx = x-1:x+1
    for yy = y-1:y+1
        if xx>0&xx<5&yy>0&&yy<5&norm([xx;yy]-[x;y])<1.1...
                &~(x==xx&y==yy)
            neis = [neis;xx,yy];
        end
    end
end
