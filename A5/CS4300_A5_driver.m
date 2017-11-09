function [mean] = CS4300_A5_driver(num_trials, num_boards)

load('A5_boards.mat');

total_scores = zeros(1,250);

for i=1:num_trials
    for j=1:num_boards
        clear('CS4300_MC_agent');
        [scr,trc] = CS4300_WW1(50,'CS4300_MC_agent',boards(j).board);
        total_scores(j) = total_scores(j) + scr;
    end
end

mean = total_scores/num_trials;
end

