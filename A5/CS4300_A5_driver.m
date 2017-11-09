function [res] = CS4300_A5_driver(num_trials)

load('A5_boards.mat');

res.total_scores = zeros(1,250);
res.successes = zeros(1,250);

for i=1:num_trials
    for j=1:250
        clear('CS4300_MC_agent');
        [scr,trc] = CS4300_WW1(50,'CS4300_MC_agent',boards(j).board);
        res.total_scores(j) = res.total_scores(j) + scr;
        if scr > 0
            res.successes(j) = res.successes(j) + 1;
        end
    end
end

res.averages = total_scores/num_trials;
res.mean = 0;
for k=1:num_boards
    res.mean = res.mean + res.averages(k);
end
res.mean = mean/num_boards;
end

