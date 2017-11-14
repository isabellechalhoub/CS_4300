function [pc,a] = CS4300_EC_driver( num_trials )

boards(1).board = [0,0,0,0;0,0,0,0;0,2,0,0;0,0,0,0];
boards(2).board = [0,1,0,2;1,0,0,0;0,0,0,0;0,0,0,1];
boards(3).board = [2,0,0,1;0,1,0,0;0,0,0,1;0,0,0,0];
boards(4).board = [1,1,1,1;1,2,1,1;0,0,1,1;0,1,1,1];

a1 = 'CS4300_agent_Astar';
a2 = 'CS4300_agent_Astar_PC';

pc.total_scores = zeros(1,4);
pc.successes = zeros(1,4);
pc.score = zeros(4,num_trials);

a.total_scores = zeros(1,4);
a.successes = zeros(1,4);
a.score = zeros(4,num_trials);

for j=1:4
    j
    for i=1:num_trials
        clear(a1);
        clear(a2);
        [scr,trc] = CS4300_WW1(50,a2,boards(j).board);
        pc.score(j,i) = scr;
        pc.total_scores(j) = pc.total_scores(j) + scr;
        if scr > 0
            pc.successes(j) = pc.successes(j) + 1;
        end
        
        [scr,trc] = CS4300_WW1(50,a1,boards(j).board);
        a.score(j,i) = scr;
        a.total_scores(j) = a.total_scores(j) + scr;
        if scr > 0
            a.successes(j) = a.successes(j) + 1;
        end
    end
    a.averages(j) = floor(a.total_scores(j)/num_trials);
    pc.averages(j) = floor(pc.total_scores(j)/num_trials);
end

pc.mean = sum(pc.averages)/250;
a.mean = sum(a.averages)/250;
end

