function policy = CS4300_MDP_policy(S,A,P,U)
% CS4300_MDP_policy - generate a policy from utilities
%   See p. 648 Russell & Norvig
% On input:
%   S (vector): states (1 to n)
%   A (vector): actions (1 to k)
%   P (nxk struct array): transition model
%       (s,a).probs (a vector with n transition probabilities
%       from s to s_prime, given action a)
%   U (vector): state utilities
% On output:
%   policy (vector): actions per state
% Call:
%   p = CS4300_MDP_policy(S,A,P,U);
% Author:
%   Isabelle Chalhoub  Karla Kraiss
%   UU
%   Fall 2017

num_states = length(S);
num_actions = length(A);

policy = zeros(1, num_states);

for s=1:num_states
    a_index = 0;
    a_max = -Inf;
    
    for a=1:num_actions
        expectedUtility = 0;
        for sPrime = 1:num_states
            expectedUtility = expectedUtility + P(s,a).probs(sPrime)*U(sPrime);
        end
        if a_max < expectedUtility
            a_max = expectedUtility;
            a_index = a;
        end
    end
    
    policy(s) = a;
end

end