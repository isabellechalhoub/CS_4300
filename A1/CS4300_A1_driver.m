function res = CS4300_A1_driver(initial_max_steps, plot_it)
% CS4300_TRIALS - statistical experiments of CS4300_agent1.m
%   - Runs 2000 trials of our random agent in Wumpus World
%   - Finds the mean and variance of the steps survived.
%   - Finds how many time the agent "succeeded" reaching [2,2]
%   - Explores the importance of the max_steps on the survival and success
%     rates.
%   - Calculates the 95% confidence interval.
% On input:
%   initial_max_steps (int): The initial max number of steps the agent can 
%       take in this trial.
%   plot_it (Boolean): whether or not to plot the results.
% On output:
%   res (x double vector):
%       meanie: the mean of steps survived by the agent
%       varie: the variance of steps survived by the agent
% Call:
%   a = CS4300_A1_driver();
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017
%

% Run the 2000 trials experiment multiple times with different values for
% the max number of steps.

max_steps = 100;
res.pos = zeros(1, (max_steps-initial_max_steps));
res.neg = zeros(1, (max_steps-initial_max_steps));
res.meanies = zeros(1, (max_steps-initial_max_steps));
res.success_rate = zeros(1, (max_steps-initial_max_steps));
for steps = initial_max_steps:max_steps
    
    board = [0,1,0,0;1,0,0,0;0,2,1,1;0,0,0,0];
    num_trials = 2000;
    total_steps_survived = zeros(1,num_trials);
    total_successes = 0;

    % Run 2000 trials w/ our random agent and store each trial in a vector

    for i = 1:num_trials
        t = CS4300_WW1(steps,'CS4300_agent1', board);

        % Accumulate steps survived
        total_steps_survived(i) = length(t);

        % See if the agent found the gold
        succeeded = false;
        for j = 1:length(t)
            if (succeeded)
                break
            end
            if ((t(j).agent.x == 2) && (t(j).agent.y == 2))
                total_successes = total_successes + 1;
                succeeded = true;
            end
        end
    end

    % Calculate the mean number of steps and the variance
    meanie = mean(total_steps_survived);
    res.meanies(steps) = meanie;
    varie = var(total_steps_survived);
    res.success_rate(steps) = total_successes/num_trials*100;

    % 95% Confidence Interval:
    res.pos(steps) = meanie + (1.645*sqrt(varie/num_trials));
    res.neg(steps) = meanie - (1.645*sqrt(varie/num_trials));
    
    % Verification of our random agent:
    res.choices = zeros(1,2000);
    for k = 1:2000
        res.choices(k) = CS4300_agent1(zeros(1,5));
    end
    % Get the histogram with histogram(res.choices)
end
if (plot_it)
    hold on;
    x = 1:max_steps;
    y = res.meanies;
    err = res.pos - res.neg;
    errorbar(x, y, err);
    hold off;
    %plot(res.success_rate);
end
end

