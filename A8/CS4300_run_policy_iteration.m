function [S,A,R,P,U,Ut,policy] = CS4300_run_policy_iteration(a,b)
% CS4300_run_policy_iteration - sets up the Markov Decision Problem 
% and calls this function.
%
% Chapter 17 Russell and Norvig (Table p. 651)
% [S,A,R,P,U,Ut] = CS4300_run_value_iteration(0.999999,1000)
%
% U’ = 0.7053 0.6553 0.6114 0.3879 0.7616 0 0.6600 -1.0000
% 0.8116 0.8678 0.9178 1.0000

S = [1:16];
A = [1:4];

R = [-1, -1, -1000, -1, -1, -1, -1000, -1, -1, -1, -1000, -1, -1, ...
    -1, -1, 1000];

%garbage
P(1,1).probs = zeros(1,16);
P(1,1).probs(1) = .1;
P(1,1).probs(2) = .1;
P(1,1).probs(5) = .8;

P(1,2).probs = zeros(1,16);
P(1,2).probs(1) = .9;
P(1,2).probs(5) = .1;

P(1,3).probs = zeros(1,16);
P(1,3).probs(1) = .9;
P(1,3).probs(2) = .1;

P(1,4).probs = zeros(1,16);
P(1,4).probs(1) = .1;
P(1,4).probs(2) = .8;
P(1,4).probs(5) = .1;

P(2,1).probs = zeros(1,16);
P(2,1).probs(1) = .1;
P(2,1).probs(3) = .1;
P(2,1).probs(6) = .8;

P(2,2).probs = zeros(1,16);
P(2,2).probs(1) = .8;
P(2,2).probs(2) = .1;
P(2,2).probs(6) = .1;

P(2,3).probs = zeros(1,16);
P(2,3).probs(1) = .1;
P(2,3).probs(2) = .8;
P(2,3).probs(3) = .1;

P(2,4).probs = zeros(1,16);
P(2,4).probs(2) = .1;
P(2,4).probs(3) = .8;
P(2,4).probs(6) = .1;

P(3,1).probs = zeros(1,16);
P(3,2).probs = zeros(1,16);
P(3,3).probs = zeros(1,16);
P(3,4).probs = zeros(1,16);

P(4,1).probs = zeros(1,16);
P(4,1).probs(3) = .1;
P(4,1).probs(4) = .1;
P(4,1).probs(8) = .8;

P(4,2).probs = zeros(1,16);
P(4,2).probs(3) = .8;
P(4,2).probs(4) = .1;
P(4,2).probs(8) = .1;

P(4,3).probs = zeros(1,16);
P(4,3).probs(3) = .1;
P(4,3).probs(4) = .9;

P(4,4).probs = zeros(1,16);
P(4,4).probs(4) = .9;
P(4,4).probs(8) = .1;

P(5,1).probs = zeros(1,16);
P(5,1).probs(5) = .1;
P(5,1).probs(6) = .1;
P(5,1).probs(9) = .8;

P(5,2).probs = zeros(1,16);
P(5,2).probs(1) = .1;
P(5,2).probs(5) = .8;
P(5,2).probs(9) = .1;

P(5,3).probs = zeros(1,16);
P(5,3).probs(1) = .8;
P(5,3).probs(5) = .1;
P(5,3).probs(6) = .1;

P(5,4).probs = zeros(1,16);
P(5,4).probs(1) = .1;
P(5,4).probs(6) = .8;
P(5,4).probs(9) = .1;

P(6,1).probs = zeros(1,16);
P(6,1).probs(5) = .1;
P(6,1).probs(7) = .1;
P(6,1).probs(10) = .8;

P(6,2).probs = zeros(1,16);
P(6,2).probs(2) = .1;
P(6,2).probs(5) = .8;
P(6,2).probs(10) = .1;

P(6,3).probs = zeros(1,16);
P(6,3).probs(2) = .8;
P(6,3).probs(5) = .1;
P(6,3).probs(7) = .1;

P(6,4).probs = zeros(1,16);
P(6,4).probs(2) = .1;
P(6,4).probs(7) = .8;
P(6,4).probs(10) = .1;

P(7,1).probs = zeros(1,16);
P(7,2).probs = zeros(1,16);
P(7,3).probs = zeros(1,16);
P(7,4).probs = zeros(1,16);

P(8,1).probs = zeros(1,16);
P(8,1).probs(7) = .1;
P(8,1).probs(8) = .1;
P(8,1).probs(12) = .8;

P(8,2).probs = zeros(1,16);
P(8,2).probs(4) = .1;
P(8,2).probs(7) = .8;
P(8,2).probs(12) = .1;

P(8,3).probs = zeros(1,16);
P(8,3).probs(4) = .8;
P(8,3).probs(7) = .1;
P(8,3).probs(8) = .1;

P(8,4).probs = zeros(1,16);
P(8,4).probs(4) = .1;
P(8,4).probs(8) = .8;
P(8,4).probs(12) = .1;

P(9,1).probs = zeros(1,16);
P(9,1).probs(9) = .1;
P(9,1).probs(10) = .1;
P(9,1).probs(13) = .8;

P(9,2).probs = zeros(1,16);
P(9,2).probs(5) = .1;
P(9,2).probs(9) = .8;
P(9,2).probs(13) = .1;

P(9,3).probs = zeros(1,16);
P(9,3).probs(5) = .8;
P(9,3).probs(9) = .1;
P(9,3).probs(10) = .1;

P(9,4).probs = zeros(1,16);
P(9,4).probs(5) = .1;
P(9,4).probs(10) = .8;
P(9,4).probs(13) = .1;

P(10,1).probs = zeros(1,16);
P(10,1).probs(9) = .1;
P(10,1).probs(11) = .1;
P(10,1).probs(14) = .8;

P(10,2).probs = zeros(1,16);
P(10,2).probs(6) = .1;
P(10,2).probs(9) = .8;
P(10,2).probs(14) = .1;

P(10,3).probs = zeros(1,16);
P(10,3).probs(6) = .8;
P(10,3).probs(9) = .1;
P(10,3).probs(11) = .1;

P(10,4).probs = zeros(1,16);
P(10,4).probs(6) = .1;
P(10,4).probs(11) = .8;
P(10,4).probs(14) = .1;

P(11,1).probs = zeros(1,16);
P(11,2).probs = zeros(1,16);
P(11,3).probs = zeros(1,16);
P(11,4).probs = zeros(1,16);

P(12,1).probs = zeros(1,16);
P(12,1).probs(11) = .1;
P(12,1).probs(12) = .1;
P(12,1).probs(16) = .8;

P(12,2).probs = zeros(1,16);
P(12,2).probs(8) = .1;
P(12,2).probs(11) = .8;
P(12,2).probs(16) = .1;

P(12,3).probs = zeros(1,16);
P(12,3).probs(8) = .8;
P(12,3).probs(11) = .1;
P(12,3).probs(12) = .1;

P(12,4).probs = zeros(1,16);
P(12,4).probs(8) = .1;
P(12,4).probs(12) = .8;
P(12,4).probs(16) = .1;

P(13,1).probs = zeros(1,16);
P(13,1).probs(13) = .9;
P(13,1).probs(14) = .1;

P(13,2).probs = zeros(1,16);
P(13,2).probs(9) = .1;
P(13,2).probs(13) = .9;

P(13,3).probs = zeros(1,16);
P(13,3).probs(9) = .8;
P(13,3).probs(13) = .1;
P(13,3).probs(14) = .1;

P(13,4).probs = zeros(1,16);
P(13,4).probs(9) = .1;
P(13,4).probs(13) = .1;
P(13,4).probs(14) = .8;

P(14,1).probs = zeros(1,16);
P(14,1).probs(13) = .1;
P(14,1).probs(14) = .8;
P(14,1).probs(15) = .1;

P(14,2).probs = zeros(1,16);
P(14,2).probs(10) = .1;
P(14,2).probs(13) = .8;
P(14,2).probs(14) = .1;

P(14,3).probs = zeros(1,16);
P(14,3).probs(10) = .8;
P(14,3).probs(13) = .1;
P(14,3).probs(15) = .1;

P(14,4).probs = zeros(1,16);
P(14,4).probs(10) = .1;
P(14,4).probs(14) = .1;
P(14,4).probs(15) = .8;

P(15,1).probs = zeros(1,16);
P(15,1).probs(14) = .1;
P(15,1).probs(15) = .8;
P(15,1).probs(16) = .1;

P(15,2).probs = zeros(1,16);
P(15,2).probs(11) = .1;
P(15,2).probs(14) = .8;
P(15,2).probs(15) = .1;

P(15,3).probs = zeros(1,16);
P(15,3).probs(11) = .8;
P(15,3).probs(14) = .1;
P(15,3).probs(16) = .1;

P(15,4).probs = zeros(1,16);
P(15,4).probs(11) = .1;
P(15,4).probs(15) = .1;
P(15,4).probs(16) = .8;

P(16,1).probs = zeros(1,16);
P(16,2).probs = zeros(1,16);
P(16,3).probs = zeros(1,16);
P(16,4).probs = zeros(1,16);

% generate the expected utilities
[policy, U, Ut] = CS4300_MDP_policy_iteration(S,A,P,R,3,0.999999);

end

