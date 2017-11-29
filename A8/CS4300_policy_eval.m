function [ Ures ] = CS4300_policy_eval(policy,U,S,P,R,k,gamma)
% CS4300_policy_eval - policy evaluator for our MDP policy iteration
%   algorithm to approximate utilities given a policy
% On input:
%   policy (nx1 vector): policyy for problem
%   U (nx1 vector): utilities
%   S (vector): states (1 to n)
%   P (nxk array): transition model
%   R (vector): state rewards
%   k (int): number of iterations
%   gamma (float): discount factor
% On output:
%   Ures (nx1 vector): resulting utilities
% Call:
%   Ures = CS4300_policy_eval(policy,U,S,P,R,k,gamma);
% Author:
%   Isabelle Chalhoub Karla Kraiss
%   UU
%   Fall 2017
%

num_states = length(S);

for i=1:k % 10 seems to be pretty good
    Ures = zeros(num_states,1);
    for s=1:num_states
        EU = 0;
        for sp=1:num_states
            EU = EU + P(s,policy(s)).probs(sp) * U(sp);
        end
        Ures(s) = R(s) + (gamma*EU);
    end
    U = Ures;
end

end

