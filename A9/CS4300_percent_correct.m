function [percent] = CS4300_percent_correct(X,y,w)
% CS4300_PERCENT_CORRECT -- calculates how many times the prediction was
% correct by comparing each value against the actual value
% On input:
%   X (nxm array): n independent variable samples each of length m
%   y (nx1 vector): dependent variable samples
%   w ((m+1)x1 vector): the weight of the samples
% On output:
%   percent: the percentage of correct predictions

correct_count = 0;

for x_i=1: length(y)
    predict = (dot([1,X(x_i,:)], w) >= 0);
    if predict == y(x_i)
        correct_count = correct_count + 1;
    end
end

percent = correct_count/length(y);
end

