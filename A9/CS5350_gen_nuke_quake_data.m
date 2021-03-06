function [data_lin,data_not_lin,indexes_lin_quake,indexes_lin_nuke,...
    indexes_nl_quake,indexes_nl_nuke] = CS5350_gen_nuke_quake_data
%
% x1: body wave magnitude
% x2: surface wave magnitude
% linear data separated by x2 = 1.7*x1 - 4.9
% p. 723 Russell and Norwig

data_lin = [4.5,4.8;...
    4.75,4.1;...
    4.75,4.5;...
    5,6;...
    5.1,4.9;...
    5.1,5.0;...
    5.2,3.4;...
    5.2,5.4;...
    5.25,4.4;...
    5.25,5.5;...
    5.35,5.7;...
    5.5,5.45;...
    5.5,5.5;...
    5.6,3.7;...
    5.6,5.0;...
    5.6,5.1;...
    5.7,5.4;...
    5.7,5.5;...
    5.7,5.9;...
    5.7,6.0;...
    5.8,3.4;...
    5.8,4.3;...
    5.8,4.5;...
    5.8,5.5;...
    5.9,3.9;...
    5.9,4.3;...
    5.9,4.35;...
    5.9,4.5;...
    5.9,5.7;...
    5.9,5.8;...
    5.9,6;...
    6,4;...
    6,4.1;...
    6,4.6;...
    6,6.6;...
    6.1,4.2;...
    6.1,4.4;...
    6.1,4.5;...
    6.1,4.7;...
    6.1,5.9;...
    6.1,6.0;...
    6.1,6.1;...
    6.1,6.5;...
    6.1,6.6;...
    6.1,6.7;...
    6.2,4.4;...
    6.2,4.5;...
    6.2,4.6;...
    6.2,6.5;...
    6.3,6.5;...
    6.6,6.8];

data_not_lin = [data_lin;5,4;5.3,3.8;5.4,4.1;5.5,3.5;5.5,4;5.9,5;...
    5.9,5.5;6.1,5.6;6.35,5.5;6.4,5.8];

dlh = [data_lin,ones(51,1)];
w = [1.7;-1;-4.9];
res = dlh*w;
indexes_lin_quake = find(res<=0);
indexes_lin_nuke = find(res>0);

indexes_nl_quake = [indexes_lin_quake;52;53;59;60];
indexes_nl_nuke = [indexes_lin_nuke;54;55;56;57;58;61];
