 function [p,q,P13,P22,P31,P13_MC,P22_MC,P31_MC] = CS4300_Naive_Bayes(...
    num_samps)
% CS4300_Naive_Bayes - compare Naive Bayes and Monte Carlo
% On input:
%     num_samps (int): number of Monte Carlo samples
% On output:
%     p (float): probability of specified breezes (Naive Bayes)
%     q (float): probability of specified breezes (Monte Carlo)
%     P13 (float): P(P13) given specified breezes (Naive Bayes)
%     P22 (float): P(P22) given specified breezes (Naive Bayes)bb
%     P31 (float): P(P31) given specified breezes (Naive Bayes)
%     P13 (float): P(P13) given specified breezes (Monte Carlo)
%     P22 (float): P(P22) given specified breezes (Monte Carlo)
%     P31 (float): P(P31) given specified breezes (Monte Carlo)
% Call:
%     [p,q,P13,P22,P31,P13_MC,P22_MC,P31_MC] = CS4300_Naive_Bayes(100000);
% Author:
%     T. Henderson
%     UU
%     Fall 2017
%

p = 0;
q = 0;
count = 0;
P13 = 0;
P22 = 0;
P31 = 0;
for n = 0:2^16-1
    bits = CS4300_int2bits(n,16);
    if ((bits(6)==1&bits(3)==0&bits(9)==0)...
            |(bits(3)==1&bits(6)==0&bits(9)==1)...
            |(bits(3)==0&bits(6)==1&bits(9)==1)...
            |(bits(3)==1&bits(6)==1&bits(9)==0)...
            |(bits(3)==1&bits(6)==1&bits(9)==1))...
            &bits(1)==0&bits(2)==0&bits(5)==0
        P_effect = 1;
        count = count + 1;
    else
        P_effect = 0;
    end
    P_cause = 1;
    for k = 1:16
        if bits(k)==0
            P_cause = P_cause*0.8;
        else
            P_cause = P_cause*0.2;
        end
    end
    p = p + P_effect*P_cause;
    if P_effect==1&bits(3)==1
        P13 = P13 + P_cause;
    end
    if P_effect==1&bits(6)==1
        P22 = P22 + P_cause;
    end
    if P_effect==1&bits(9)==1
        P31 = P31 + P_cause;
    end
end
P13 = P13/p;
P22 = P22/p;
P31 = P31/p;

%num_samps = 10000;
P13_MC = 0;
P22_MC = 0;
P31_MC = 0;
count = 0;
br = -ones(4,4);
br(4,1) = 0;
br(4,2) = 1;
br(3,1) = 1;
st = -ones(4,4);
st(4,1) = 0;
st(4,2) = 0;
st(3,1) = 0;
for s = 1:num_samps
    b = CS4300_gen_board_no_GW(0.2);
    if CS4300_board_OK(b,br,st)
        count = count + 1;
        if b(2,1)==1
            P13_MC = P13_MC + 1;
        end
        if b(3,2)==1
            P22_MC = P22_MC + 1;
        end
        if b(4,3)==1
            P31_MC = P31_MC + 1;
        end
    end
end
P13_MC = P13_MC/count;
P22_MC = P22_MC/count;
P31_MC = P31_MC/count;

q = count/num_samps;