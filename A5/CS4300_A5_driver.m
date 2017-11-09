function [res] = CS4300_A5_driver(num_trials)
% CS4300_A5_driver - runs the MC agent for a number of trials on each of a 
%   set 250 boards to calculate the average score and success of the agent
% On input:
%     num_trials : how many trials to run on each board
% On output:
%     res (struct) : various computations
%       total_scores (1x250) : total sum of scores achieved on each board
%       successes (1x250) : total number of successes on each board
%       score (250xnum_trials) : singular score for the board on that trial
%       averages (1x250) : average score per board
%       variances (1x250) : variance per board
%       mean : total average score of every trial of every board
% Call:
%     a = CS4300_A5_driver(10);
% Author:
%     Isabelle Chalhoub     Karla Kraiss
%     UU
%     Fall 2016
%

load('A5_boards.mat');

res.total_scores = zeros(1,250);
res.successes = zeros(1,250);
res.score = zeros(250,num_trials);

for j=1:250
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
end

