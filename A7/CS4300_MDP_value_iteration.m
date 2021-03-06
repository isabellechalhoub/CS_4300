function [U,Ut] = CS4300_MDP_value_iteration(S,A,P,R,gamma,...
    eta,max_iter)
% CS4300_MDP_value_iteration - compute policy using value iteration
% On input:
%   S (vector): states (1 to n)
%   A (vector): actions (1 to k)
%   P (nxk struct array): transition model
%       (s,a).probs (a vector with n transition probabilities
%       (from s to s_prime, given action a)
%   R (vector): state rewards
%   gamma (float): discount factor
%   eta (float): termination threshold
%   max_iter (int): max number of iterations
% On output:
%   U (vector): state utilities
%   U_trace (iterxn): trace of utility values during iteration
% Call:
%   [U,Ut] = CS4300_MDP_value_iteration(S,A,P,R,0.999999,0.1,100);
%
%   Set up a driver function, CS_4300_run_value_iteration (see
%   below), which sets up the Markov Decision Problem and calls this
%   function.
%
%   Chapter 17 Russell and Norvig (Table p. 651)
%   [S,A,R,P,U,Ut] = CS4300_run_value_iteration(0.999999,1000)
%
%   U'�= 0.7053 0.6553 0.6114 0.3879 0.7616 0 0.6600 -1.0000
%       0.8116 0.8678 0.9178 1.0000
%
%   Layout:              1
%                        ^
%     9 10 11 12         |
%     5  6  7  8     2 <- -> 4
%     1  2  3  4         |
%                        V
%                        3
% Author:  
%   Isabelle Chalhoub   Karla Kraiss
%   UU
%   Fall 2017
%

num_states = length(S);
num_actions = length(A);

U = zeros(1,num_states);
Ut = U;
Up = U;
delta = Inf;
iter_count = 0;
while delta >= eta*((1-gamma)/gamma) && iter_count <= max_iter
    iter_count = iter_count + 1;
    U = Up;
    delta = 0;
    for s = 1:num_states
        a_max = -Inf;
        for a =1:num_actions
            EU = 0;
            for sp = 1:num_states
                EU = EU + P(s,a).probs(sp)*U(sp);
            end
            if a_max < EU
                a_max = EU;
            end
        end
        Up(s) = R(s) + gamma*a_max;
        if abs(Up(s) - U(s)) > delta
            delta = abs(Up(s) - U(s));
        end
    end
    Ut = [Ut;U];
end

end