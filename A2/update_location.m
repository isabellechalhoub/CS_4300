function res = update_location( choice, x_loc, y_loc, direc )
%UPDATE_LOCATION Summary of this function goes here
%   Detailed explanation goes here

res.new_x = x_loc;
res.new_y = y_loc;
res.new_direc = direc;

switch choice
    case 1
        if direc == 0 && x_loc < 4
            res.new_x = x_loc + 1;
        end
        if direc == 1 && y_loc < 4
            res.new_y = y_loc + 1;
        end
        if direc == 2 && x_loc > 1
            res.new_x = x_loc - 1;
        end
        if direc == 3 && y_loc > 1
            res.new_y = y_loc - 1;
        end
    case 2
        if direc == 0
            res.new_direc = 3;
        else
            res.new_direc = direc - 1;
        end
    case 3
        if direc == 3
            res.new_direc = 0;
        else
            res.new_direc = direc + 1;
        end
end

end

