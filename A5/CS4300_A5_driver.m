function [res] = CS4300_A5_driver(num_trials)

load('A5_boards.mat');

res.total_scores = zeros(1,250);
res.successes = zeros(1,250);
res.score = zeros(250,num_trials);

% for i=1:num_trials
%     i
%     for j=1:250
%         clear('CS4300_MC_agent');
%         [scr,trc] = CS4300_WW1(50,'CS4300_agent1',boards(j).board);
%         res.total_scores(j) = res.total_scores(j) + scr;
%         if scr > 0
%             res.successes(j) = res.successes(j) + 1;
%         end
%     end
% end

for j=1:250
    j
    for i=1:num_trials
        clear('CS4300_MC_agent');
        [scr,trc] = CS4300_WW1(50,'CS4300_MC_agent',boards(j).board);
        res.score(j,i) = scr;
        res.total_scores(j) = res.total_scores(j) + scr;
        if scr > 0
            res.successes(j) = res.successes(j) + 1;
        end
    end
    res.averages(j) = res.total_scores(j)/num_trials;
    res.variance(j) = var(res.score(j,:));
end

res.mean = sum(res.averages)/250;

%res.averages = res.total_scores/num_trials;
% res.mean = 0;
% for k=1:250
%     res.mean = res.mean + res.averages(k);
% end
% res.mean = res.mean/250;
end

