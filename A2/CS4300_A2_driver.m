function res = CS4300_A2_driver(initial_max_steps, plot_it)
% CS4300_A2_driver - statistical experiments of CS4300_agent_Astar.m
% On input:
%   initial_max_steps (int): The initial max number of steps the agent can 
%       take in this trial.
%   plot_it (Boolean): whether or not to plot the results.
% On output:
%   res (x double vector):
%       meanie: the mean of steps survived by the agent
%       varie: the variance of steps survived by the agent
% Call:
%   a = CS4300_A2_driver();
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
    
    board = [0,0,0,0;0,0,0,0;0,2,0,0;0,0,0,0];
    num_trials = 500;
    total_steps_survived = zeros(1,num_trials);
    total_steps_home = 0;
    total_successes = 0;
    steps_home = 0;

    % Run 2000 trials w/ our random agent and store each trial in a vector
    for i = 1:num_trials
        clear 'CS4300_agent_Astar'
        t = CS4300_WW1(steps,'CS4300_agent_Astar', board);

        % Accumulate steps survived
        total_steps_survived(i) = length(t);
        
        % See if the agent found the gold
        succeeded = false;
        if t(length(t)).agent.x == 1 && t(length(t)).agent.y == 1 && t(length(t)).action == 6
            succeeded = true;
            total_successes = total_successes + 1;
        end
        
        succeeded = false;
        for j = 1:length(t)
            if (succeeded)
                steps_home = steps_home + 1;
            end
            if ((t(j).agent.x == 2) && (t(j).agent.y == 2))
                succeeded = true;
            end
        end
        total_steps_home = total_steps_home + steps_home;
        steps_home = 0;
    end

    % Calculate the mean number of steps and the variance
    meanie = mean(total_steps_survived);
    res.meanies(steps) = meanie;
    varie = var(total_steps_survived);
    res.success_rate(steps) = total_successes/num_trials*100;
    res.avg_steps_home(steps) = total_steps_home/num_trials;
    % 95% Confidence Interval:
    res.pos(steps) = meanie + (1.645*sqrt(varie/num_trials));
    res.neg(steps) = meanie - (1.645*sqrt(varie/num_trials));
    
%     % Verification of our random agent:
%     res.choices = zeros(1,2000);
%     for k = 1:2000
%         res.choices(k) = CS4300_agent_Astar(zeros(1,5));
%     end
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
    plot(res.avg_steps_home);
end
end

