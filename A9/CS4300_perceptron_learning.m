function [w,per_cor] = ...
    CS4300_perceptron_learning(X,y,alpha,max_iter,rate)
% CS4300_perceptron_learning - find linear separating hyperplane
%   Eqn 18.7, p. 724 Russell and Norvig
% On input:
%   X (nxm array): n independent variable samples each of length m
%   y (nx1 vector): dependent variable samples
%   alpha (float): learning rate
%   max_iter (int): max number of iterations
%   rate (Boolean): if 1 then alpha = 1000/(1000+iter), else
%       constant
% On output:
%   w ((m+1)x1 vector): weights for linear function
%   per_cor (kx1 array): trace of percentage correct with weight
% Call:
%   [w,pc] = CS4300_perceptron_learning(X,y,0.1,10000,1);
% Author:
%   Isabelle Chalhoub       Karla Kraiss
%   UU
%   Fall 2017
%

% add 1's column to the beginning of x so it is n by m+1
n = size(X,1);
m = size(X,2);

% initialize w to contain small rand numbers
w = rand(1, m+1) - .5;

done = false;
iter = 1;

while ~done
    if rate
        alpha = 1000/(1000+iter);
    end
    k = ceil(rand * n);
    y_r = y(k);
    x_r = [1,X(k,:)];
    hw = (dot(w,x_r) >= 0);
    per_cor(iter) = CS4300_percent_correct(X, y, w);
    if per_cor(iter) == 1 || iter > max_iter
        done = true;
    else
        for j = 1: m + 1
            w(j) = w(j) + alpha * (y_r - hw) * x_r(j);
        end
    end
iter = iter + 1;
end

end
