function [w,per_cor,Se] = ...
    CS4300_logistic_learning(X,y,alpha,max_iter,rate)
% CS4300_logistic_learning - find linear separating hyperplane
%   Eqn 18.8, p. 727 Russell and Norvig
% On input:
%   X (nxm array): n independent variable samples each of length m
%   y (nx1 vector): dependent variable samples
%   alpha (float): learning rate
%   max_iter (int): max number of iterations
%   rate (Boolean): 1 use alpha = 1000/(1000+iter) else constant
%       alpha
% On output:
%   w ((m+1)x1 vector): weights for linear function
%   per_cor (kx1 array): trace of percentage correct with weight
%   Se (kx1 array): trace of squared error
% Call:
%   [w,pc,Se] = CS4300_logistic_learning(X,y,0.1,10000,1);
% Author:
%   Isabelle Chalhoub       Karla Kraiss
%   UU
%   Fall 2017
%

% add 1's column to the beginning of x so it is n by m+1
n = size(X,1);
X = [ones(n,1) X];

% initialize w to small rand number
w = rand*ones(m,1);

done = false;
iter = 0;

while ~done
    if rate
        alpha = 1000/(1000/iter);
    end
    hw = (1/(1+exp(-X*w)));
%     error = calculate error;  (squared per sample) - look at notebook
    if error == 0 || iter >= max_iter
        done = true;
    else
        k = ceil(rand * n);
        x = X(k,:);
        w = w + alpha(y-hw) * x;
    end
end

end

