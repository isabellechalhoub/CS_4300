function [mean] = CS4300_A5_driver(num_trials)

load('A5_boards.mat');

total_scores = zeros(1,250);

for i=1:num_trials
    for j=1:250
        clear('CS4300_MC_agent');
        [scr,trc] = CS4300_WW1(50,'CS4300_MC_agent',boards(j).board);
        total_scores(j) = total_scores(j) + scr;
    end
end

averages = total_scores/num_trials;
mean = 0;
for k=1:num_boards
    mean = mean + averages(k);
end
mean = mean/num_boards;
end

