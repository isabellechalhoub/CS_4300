function [policy,U,Ut] = CS4300_MDP_policy_iteration(S,A,P,R,k,gamma)
% CS4300_MDP_policy_iteration - policy iteration
%   Chapter 17 Russell and Norvig (Table p. 657)
% On input:
%   S (vector): states (1 to n)
%   A (vector): actions (1 to k)
%   P (nxk array): transition model
%   R (vector): state rewards
%   k (int): number of iterations
%   gamma (float): discount factor
% On output:
%   policy (nx1 vector): policy for problem
%   U (nx1 vector): final utilities found
%   Ut (num_iter by n array): trace of utilities (each is U at that step)
% Call:
%
%   Layout:              1
%                        ?
%   9 10 11 12           |
%   5  6  7  8       2 <- -> 4
%   1  2  3  4           |
%                        V
%                        3
%   [S,A,R,P,U,Ut] = CS4300_run_value_iteration(0.999999,1000);
%   [p,Up,Tpt] = CS4300_MDP_policy_iteration(S,A,P,R,10,0.999)
%   p?
%
%   p =
%
%   1               corrresponds to:
%   2
%   2               -> -> -> X
%   2               ?  X  ?  X
%   1               ? <- <- <-
%   1
%   1
%   1
%   4
%   4
%   4
%   1
%
% Author:
%   Isabelle Chalhoub Karla Kraiss
%   UU
%   Fall 2017
%

num_states = length(S);
num_actions = length(A);

U = zeros(1, num_states);
Ut = 0;

policy = ones(1, num_states);

unchanged = false;

for i=1:k
    if unchanged
        break;
    end
    U = CS4300_policy_eval(policy,U,S,P,R,k,gamma);
    unchanged = true;
    for s=1:num_states
        max_EU = -Inf;
        a_max = 0;
        for a=1:num_actions
            EU = 0;
            EP = 0;
            for sp=1:num_states
                EU = EU + P(s,a).probs(sp)*U(sp);
                EP = EP + P(s,policy(s)).probs(sp)*U(sp);
            end
            if max_EU < EU
                max_EU = EU;
                a_max = a;
            end
        end
        if max_EU > EP
            policy(s) = a_max;
            unchanged = false;
        end
    end
end