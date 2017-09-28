function [ avg ] = CS4300_KB_RTP_driver( plot_it )
% CS4300_KB_RTP_driver - run RTP many times with varying sizes of KB to see
% how efficient RTP is and analyze the slowness.
%   On input:
%       plot_it : boolean - whether to plot or not.
%   On output:
%       N/A
%   Call:
%       CS4300_KB_RTP_driver(true);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017
%

clauses(1).clause = [1,2,3];
clauses(2).clause = [-1];
clauses(3).clause = [-2];
clauses(4).clause = [-3];
clauses(5).clause = [4];
clauses(6).clause = [5];
clauses(7).clause = [1,2,7];
clauses(8).clause = [-6];

KB = [];
thm(1).clauses = 6;
vars = [1,2,3,4,5,6,7];

num_clauses = 8;
avg = [num_clauses];

for i=1:num_clauses
    KB(i).clauses = clauses(i).clause;
    
    sum = 0;
    for j=1:10
        f = @() CS4300_RTP(KB,thm,vars);
        time = timeit(f);
        sum = sum + time;
    end
    avg = [avg, sum/10];
end

if (plot_it)
    hold on;
    x = [1,2,3,4,5,6,7,8];
    y = avg(2:end);
    plot(x,y);
    hold off;
end

end

