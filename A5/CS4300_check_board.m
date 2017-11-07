function [ good_board ] = CS4300_check_board(board,percept_board)
% CS4300_check_board - checks that a board of info matches a given board
% On input:
%     board : (4x4) Wumpus or Pit board
%     percept_board : (4x4) Breeze or Stench board
% On output:
%     good_board : true/false if the info matches the board or not
% Call:
%     board = [0,0,1,0;0,1,0,0;0,0,1,0;0,0,0,1;];
%     percept_board = -ones(4,4);
%     percept_board(4,1) = 0;
%     percept_board(2,3) = 1;
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
        find_it = false;
        found_it = false;
        % set a flag meaning the percept dictates that we must find a 1 in
        % one of the neighboring cells.
        if percept_board(x,y) == 1
            find_it = true;
        end
        % check each neighbor
        for i=1:length(neis)
            n_x = neis(i,1);
            n_y = neis(i,2);
            % if there is a pit/wumpus but the percept doesn't match
            if (board(n_x,n_y) == 1 && percept_board(x,y) == 0)
                good_board = false;
                return;
            elseif find_it && board(n_x,n_y) == 1
                % successfully found a neighbor to match the percept
                found_it = true;
            end
        end
        % if we never found a neighbor to match the percept
        if find_it && ~found_it
            good_board = false;
            return;
        end
    end
end
good_board = true;
end

