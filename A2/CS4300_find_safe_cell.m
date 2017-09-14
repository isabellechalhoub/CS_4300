function goal_cell = CS4300_find_safe_cell( D , curr_location)
% function to help the agent decide on a safer path to explore the frontier
cell_translation = [1,1; 2,1; 3,1; 4,1;
                    1,2; 2,2; 3,2; 4,2;
                    1,3; 2,3; 3,3; 4,3;
                    1,4; 2,4; 3,4; 4,4;];

for index=1:16
    if (D(index,1) + D(index,2) + D(index,3)) == 2
        goal_cell = cell_translation(index,:);
        if goal_cell == curr_location
            continue;
        end
        return;
    end
end
goal_cell = [-1,-1];
end

