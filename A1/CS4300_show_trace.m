function M = CS4300_show_trace(trace,p)
% CS4300_show_trace - show (and make movie of ) trace
% On input:
%     trace (trace data structure): board and agent info
%     p (int): pause (in seconds) between frames
% On output:
%     M (movie): movie from show
% Call:
%     b = CS4300_gen_board(0.2);
%     t = CS4300_WWW1(5,'CS400_Example1',b);
%     M = CS4300_show_trace(t);
% Author:
%     T. Henderson
%     UU
%     Summer 2015
%

num_trace = length(trace);
for t = 1:num_trace
    CS4300_show_board(trace(t).board,trace(t).agent);
    title_text = ['Step ',num2str(t)];
    title(title_text);
    pause(p);
    M(t) = getframe;
end
