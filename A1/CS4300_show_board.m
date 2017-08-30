function CS4300_show_board(board,agent)
% CS4300_show_board - show board and agent on it
% On input:
%     board (4x4 int array): board layout
%     agent (agent data structure): agent info
% On output:
%     N/A (makes figure of board and agent)
% Call:
%     b = CS4300_gen_board(0.2);
%     t = CS4300_WWW1(5,'CS400_Example1',b);
%     M = CS4300_show_board(t(1).board,t(1).agent);
% Author:
%     T. Henderson
%     UU
%     Summer 2015
%

PIT = 1;
GOLD = 2;
WUMPUS = 3;
BOTH = 4;

im = ones(200,200,3);

for r = 1:4
    ty = 4 - r + 1;
    for c = 1:4
        tx = c;
        ri = (r-1)*50+5;
        ci = (c-1)*50+5;
        if board(r,c)==PIT
            im(ri:ri+45,ci:ci+45,1) = 1;
            im(ri:ri+45,ci:ci+45,2) = 0;
            im(ri:ri+45,ci:ci+45,3) = 0;
        elseif board(r,c)==GOLD
            im(ri:ri+45,ci:ci+45,2) = 1;
            im(ri:ri+45,ci:ci+45,1) = 1;
            im(ri:ri+45,ci:ci+45,3) = 0;
        elseif board(r,c)==WUMPUS
            im(ri:ri+45,ci:ci+45,1) = 0;
            im(ri:ri+45,ci:ci+45,2) = 0;
            im(ri:ri+45,ci:ci+45,3) = 1;
        elseif board(r,c)==BOTH
            im(ri:ri+45,ci:ci+22,1) = 0;
            im(ri:ri+45,ci:ci+22,2) = 0;
            im(ri:ri+45,ci:ci+22,3) = 1;
            im(ri:ri+45,ci+23:ci+45,2) = 1;
            im(ri:ri+45,ci+23:ci+45,1) = 1;
            im(ri:ri+45,ci+23:ci+45,3) = 0;
        end
        if agent.x==tx&agent.y==ty
            if agent.dir==0
                im(ri+22:ri+24,ci+10:ci+30,1) = 0;
                im(ri+22:ri+24,ci+10:ci+30,2) = 0;
                im(ri+22:ri+24,ci+10:ci+30,3) = 0;
                im(ri+18:ri+28,ci+23:ci+32,1) = 0;
                im(ri+18:ri+28,ci+23:ci+32,2) = 0;
                im(ri+18:ri+28,ci+23:ci+32,3) = 0;
            elseif agent.dir==1
                im(ri+10:ri+30,ci+22:ci+24,1) = 0;
                im(ri+10:ri+30,ci+22:ci+24,2) = 0;
                im(ri+10:ri+30,ci+22:ci+24,3) = 0;
                im(ri+7:ri+17,ci+18:ci+28,1) = 0;
                im(ri+7:ri+17,ci+18:ci+28,2) = 0;
                im(ri+7:ri+17,ci+18:ci+28,3) = 0;
            elseif agent.dir==2
                im(ri+22:ri+24,ci+10:ci+30,1) = 0;
                im(ri+22:ri+24,ci+10:ci+30,2) = 0;
                im(ri+22:ri+24,ci+10:ci+30,3) = 0;
                im(ri+18:ri+28,ci+7:ci+17,1) = 0;
                im(ri+18:ri+28,ci+7:ci+17,2) = 0;
                im(ri+18:ri+28,ci+7:ci+17,3) = 0;
            else
                im(ri+10:ri+30,ci+22:ci+24,1) = 0;
                im(ri+10:ri+30,ci+22:ci+24,2) = 0;
                im(ri+10:ri+30,ci+22:ci+24,3) = 0;
                im(ri+23:ri+32,ci+18:ci+28,1) = 0;
                im(ri+23:ri+32,ci+18:ci+28,2) = 0;
                im(ri+23:ri+32,ci+18:ci+28,3) = 0;
            end
        end
    end
end
im(1:4,:,:) = 0;
im(50:54,:,:) = 0;
im(100:104,:,:) = 0;
im(150:154,:,:) = 0;
im(196:200,:,:) = 0;
im(:,1:4,:) = 0;
im(:,50:54,:) = 0;
im(:,100:104,:) = 0;
im(:,150:154,:) = 0;
im(:,196:200,:) = 0;

imshow(im);
