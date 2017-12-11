function [percent, se] = CS4300_percent_correct_and_error(X, y, w)
%CS4300_percent_correct_and_error -- calculates how many times the 
% prediction was correct by comparing each value against the actual value
% On input:
%   X (nxm array): n independent variable samples each of length m
%   w ((m+1)x1 vector): the weight of the samples
%   y (nx1 vector): dependent variable samples
% On output:
%   percent: the percentage of correct predictions
%   se: the squared error of predictions
% Call:
%   [percent, se] = CS4300_percent_correct_and_error(X,y,w);
% Author:
%   Isabelle Chalhoub       Karla Kraiss
%   UU
%   Fall 2017
%

correct = 0;
se = 0;
n = length(y);
for i = 1: n
   predict = (dot([1,X(i,:)], w) >= 0);
   se = se + (y(i) - logistic(w, [1,X(i,:)]))^2;
   if predict == y(i)
       correct = correct + 1;
   end
end

percent = correct/n;
se = se/n;
end

function out = logistic(w,x)
    out = 1/(1+exp(dot(-w, x)));
end
