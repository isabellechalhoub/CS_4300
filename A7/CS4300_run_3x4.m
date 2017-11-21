function [S,A,R,P,U,Ut] = CS4300_run_3x4()
% CS_4300_run_value_iteration_verification
%
% sets up the Markov Decision Problem and calls this
% function.
%
% Chapter 17 Russell and Norvig (Table p. 651)
% [S,A,R,P,U,Ut] = CS4300_run_value_iteration(0.999999,1000)
%
% U? = 0.7053 0.6553 0.6114 0.3879 0.7616 0 0.6600 -1.0000
% 0.8116 0.8678 0.9178 1.0000

S = [1:12];
A = [1:4];

R = [-0.04, -0.04, -0.04, -0.04, -0.04, 0, -0.04, -1, -0.04, -0.04, ...
    -0.04, 1];

%garbage ugly stuff don't look at it
P(1,1).probs = zeros(1,12);
P(1,1).probs(1) = .1;
P(1,1).probs(2) = .1;
P(1,1).probs(5) = .8;

P(1,2).probs = zeros(1,12);
P(1,2).probs(1) = .9;
P(1,2).probs(5) = .1;

P(1,3).probs = zeros(1,12);
P(1,3).probs(1) = .9;
P(1,3).probs(2) = .1;

P(1,4).probs = zeros(1,12);
P(1,4).probs(1) = .1;
P(1,4).probs(2) = .8;
P(1,4).probs(5) = .1;

P(2,1).probs = zeros(1,12);
P(2,1).probs(1) = .1;
P(2,1).probs(2) = .8;
P(2,1).probs(3) = .1;

P(2,2).probs = zeros(1,12);
P(2,2).probs(1) = .8;
P(2,2).probs(2) = .2;

P(2,3).probs = zeros(1,12);
P(2,3).probs(1) = .1;
P(2,3).probs(2) = .8;
P(2,3).probs(3) = .1;

P(2,4).probs = zeros(1,12);
P(2,4).probs(2) = .2;
P(2,4).probs(3) = .8;

P(3,1).probs = zeros(1,12);
P(3,1).probs(2) = .1;
P(3,1).probs(4) = .1;
P(3,1).probs(7) = .8;

P(3,2).probs = zeros(1,12);
P(3,2).probs(2) = .8;
P(3,2).probs(3) = .1;
P(3,2).probs(7) = .1;

P(3,3).probs = zeros(1,12);
P(3,3).probs(2) = .1;
P(3,3).probs(3) = .8;
P(3,3).probs(4) = .1;

P(3,4).probs = zeros(1,12);
P(3,4).probs(3) = .1;
P(3,4).probs(4) = .8;
P(3,4).probs(7) = .1;

P(4,1).probs = zeros(1,12);
P(4,1).probs(3) = .1;
P(4,1).probs(4) = .1;
P(4,1).probs(8) = .8;

P(4,2).probs = zeros(1,12);
P(4,2).probs(3) = .8;
P(4,2).probs(4) = .1;
P(4,2).probs(8) = .1;

P(4,3).probs = zeros(1,12);
P(4,3).probs(3) = .1;
P(4,3).probs(4) = .9;

P(4,4).probs = zeros(1,12);
P(4,4).probs(4) = .9;
P(4,4).probs(8) = .1;

P(5,1).probs = zeros(1,12);
P(5,1).probs(5) = .2;
P(5,1).probs(9) = .8;

P(5,2).probs = zeros(1,12);
P(5,2).probs(1) = .1;
P(5,2).probs(5) = .8;
P(5,2).probs(9) = .1;

P(5,3).probs = zeros(1,12);
P(5,3).probs(1) = .8;
P(5,3).probs(5) = .2;

P(5,4).probs = zeros(1,12);
P(5,4).probs(1) = .1;
P(5,4).probs(5) = .8;
P(5,4).probs(9) = .1;

P(6,1).probs = zeros(1,12);
P(6,2).probs = zeros(1,12);
P(6,3).probs = zeros(1,12);
P(6,4).probs = zeros(1,12);

P(7,1).probs = zeros(1,12);
P(7,1).probs(7) = .1;
P(7,1).probs(8) = .1;
P(7,1).probs(11) = .8;

P(7,2).probs = zeros(1,12);
P(7,2).probs(3) = .1;
P(7,2).probs(7) = .8;
P(7,2).probs(11) = .1;

P(7,3).probs = zeros(1,12);
P(7,3).probs(3) = .8;
P(7,3).probs(7) = .1;
P(7,3).probs(8) = .1;

P(7,4).probs = zeros(1,12);
P(7,4).probs(3) = .1;
P(7,4).probs(8) = .8;
P(7,4).probs(11) = .1;

P(8,1).probs = zeros(1,12);
P(8,2).probs = zeros(1,12);
P(8,3).probs = zeros(1,12);
P(8,4).probs = zeros(1,12);

P(9,1).probs = zeros(1,12);
P(9,1).probs(9) = .9;
P(9,1).probs(10) = .1;

P(9,2).probs = zeros(1,12);
P(9,2).probs(5) = .1;
P(9,2).probs(9) = .9;

P(9,3).probs = zeros(1,12);
P(9,3).probs(5) = .8;
P(9,3).probs(9) = .1;
P(9,3).probs(10) = .1;

P(9,4).probs = zeros(1,12);
P(9,4).probs(5) = .1;
P(9,4).probs(9) = .1;
P(9,4).probs(10) = .8;  

P(10,1).probs = zeros(1,12);
P(10,1).probs(9) = .1;
P(10,1).probs(10) = .8;
P(10,1).probs(11) = .1;

P(10,2).probs = zeros(1,12);
P(10,2).probs(9) = .8;
P(10,2).probs(10) = .2;

P(10,3).probs = zeros(1,12);
P(10,3).probs(9) = .1;
P(10,3).probs(10) = .8;
P(10,3).probs(11) = .1;

P(10,4).probs = zeros(1,12);
P(10,4).probs(10) = .2;
P(10,4).probs(11) = .8;

P(11,1).probs = zeros(1,12);
P(11,1).probs(10) = .1;
P(11,1).probs(11) = .8;
P(11,1).probs(12) = .1;

P(11,2).probs = zeros(1,12);
P(11,2).probs(7) = .1;
P(11,2).probs(10) = .8;
P(11,2).probs(11) = .1;

P(11,3).probs = zeros(1,12);
P(11,3).probs(7) = .8;
P(11,3).probs(10) = .1;
P(11,3).probs(12) = .1;

P(11,4).probs = zeros(1,12);
P(11,4).probs(7) = .1;
P(11,4).probs(11) = .1;
P(11,4).probs(12) = .8;

P(12,1).probs = zeros(1,12);
P(12,2).probs = zeros(1,12);
P(12,3).probs = zeros(1,12);
P(12,4).probs = zeros(1,12);


[U, Ut] = CS4300_MDP_value_iteration(S,A,P,R,0.999999,0.1,100);

end