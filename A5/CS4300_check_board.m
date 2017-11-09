function [ good_board ] = CS4300_check_board(board,breezes,stench)
% CS4300_check_board - checks that a board of info matches a given board
% On input:
%     board : (4x4) Wumpus or Pit board
%     percept_board : (4x4) Breeze or Stench board
% On output:
%     good_board : true/false if the info matches the board or not
% Call:
%     board = [0,0,1,0;0,1,0,3;0,0,1,0;0,0,0,1;];
%     breezes = -ones(4,4);
%     breezes(4,1) = 1;
%     stench = -ones(4,4);
%     stench(3,3) = 1;
%     gb = CS4300_check_board(board, percept_board); == 1
% Author:
%     Isabelle Chalhoub   Karla Kraiss
%     UU
%     Summer 2015
%

% for each cell in the 4x4
for x=1:4
    for y=1:4
        % get the cell's neighbors
        neis = BR_Wumpus_neighbors(x,y);
        find_pit = false;
        found_pit = false;
        find_wump = false;
        found_wump = false;
        % set a flag meaning the percept dictates that we must find a 1 in
        % one of the neighboring cells.
        if breezes(x,y) == 1
            find_pit = true;
        end
        if stench(x,y) == 1
            find_wump = true;
        end
        % check each neighbor
        for i=1:length(neis)
            n_x = neis(i,1);
            n_y = neis(i,2);
            % if there is a pit/wumpus but the percept doesn't match
            if (board(n_x,n_y) == 1 && breezes(x,y) == 0)
                good_board = false;
                return;
            elseif (board(n_x,n_y) == 3 && stench(x,y) == 0)
                good_board = false;
                return;
            end
            if find_pit && board(n_x,n_y) == 1
                % successfully found a neighbor to match the percept
                found_pit = true;
            end
            if find_wump && board(n_x,n_y) == 3
                found_wump = true;
            end
        end
        % if we never found a neighbor to match the percept
        if find_pit && ~found_pit
            good_board = false;
            return;
        end
        if find_wump && ~found_wump
            good_board = false;
            return;
        end
    end
end
good_board = true;
end

