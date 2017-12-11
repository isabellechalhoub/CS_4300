function [error] = CS4300_error(w, x)
%CS4300_ERROR -- calculates how many times the prediction was
% correct by comparing each value against the actual value
% On input:
%   X (nxm array): n independent variable samples each of length m
%   w ((m+1)x1 vector): the weight of the samples
% On output:
%   error: the error predictions
error = 1/(1+exp(dot(-w,x)));
end

