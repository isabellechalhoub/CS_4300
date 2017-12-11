function [G,P,W] = CS4300_wumpus_driver

% [X,y] = CS4300_wumpus_perceptron(1,0,0);
% 
% [G.w1, G.per_cor1] = CS4300_perceptron_learning(X,y,0.1,3000,0);
% [G.w2, G.per_cor2] = CS4300_perceptron_learning(X,y,0.1,50000,0);
% [G.w3, G.per_cor3] = CS4300_perceptron_learning(X,y,0.1,50000,1);
% 
% [X,y] = CS4300_wumpus_perceptron(0,1,0);
% 
% [P.w1, P.per_cor1] = CS4300_perceptron_learning(X,y,0.1,3000,0);
% [P.w2, P.per_cor2] = CS4300_perceptron_learning(X,y,0.1,50000,0);
% [P.w3, P.per_cor3] = CS4300_perceptron_learning(X,y,0.1,50000,1);
% 
% [X,y] = CS4300_wumpus_perceptron(0,0,1);
% 
% [W.w1, W.per_cor1] = CS4300_perceptron_learning(X,y,0.1,3000,0);
% [W.w2, W.per_cor2] = CS4300_perceptron_learning(X,y,0.1,50000,0);
% [W.w3, W.per_cor3] = CS4300_perceptron_learning(X,y,0.1,50000,1);

% hold on;
% x1 = (1:length(G.per_cor1));
% x2 = (1:length(G.per_cor2));
% x3 = (1:length(G.per_cor3));
% plot(x1,G.per_cor1,'r');
% plot(x2,G.per_cor2,'g');
% plot(x3,G.per_cor3,'b');
% hold off;

% hold on;
% x1 = (1:length(P.per_cor1));
% x2 = (1:length(P.per_cor2));
% x3 = (1:length(P.per_cor3));
% plot(x1,P.per_cor1,'r');
% plot(x2,P.per_cor2,'g');
% plot(x3,P.per_cor3,'b');
% hold off;

% hold on;
% x1 = (1:length(W.per_cor1));
% x2 = (1:length(W.per_cor2));
% x3 = (1:length(W.per_cor3));
% plot(x1,W.per_cor1,'r');
% plot(x2,W.per_cor2,'g');
% plot(x3,W.per_cor3,'b');
% hold off;

% [X,y] = CS4300_wumpus_perceptron(1,0,0);
% 
% [G.w1, G.per_cor1,se] = CS4300_logistic_learning(X,y,0.1,3000,0);
% [G.w2, G.per_cor2,se] = CS4300_logistic_learning(X,y,0.1,50000,0);
% [G.w3, G.per_cor3,se] = CS4300_logistic_learning(X,y,0.1,50000,1);

% [X,y] = CS4300_wumpus_perceptron(0,1,0);
% 
% [P.w1, P.per_cor1,se] = CS4300_logistic_learning(X,y,0.1,3000,0);
% [P.w2, P.per_cor2,se] = CS4300_logistic_learning(X,y,0.1,50000,0);
% [P.w3, P.per_cor3,se] = CS4300_logistic_learning(X,y,0.1,50000,1);

[X,y] = CS4300_wumpus_perceptron(0,0,1);

[W.w1, W.per_cor1,se] = CS4300_logistic_learning(X,y,0.1,3000,0);
[W.w2, W.per_cor2,se] = CS4300_logistic_learning(X,y,0.1,50000,0);
[W.w3, W.per_cor3,se] = CS4300_logistic_learning(X,y,0.1,50000,1);

% hold on;
% x1 = (1:length(G.per_cor1));
% x2 = (1:length(G.per_cor2));
% x3 = (1:length(G.per_cor3));
% plot(x1,G.per_cor1,'r');
% plot(x2,G.per_cor2,'g');
% plot(x3,G.per_cor3,'b');
% hold off;

% hold on;
% x1 = (1:length(P.per_cor1));
% x2 = (1:length(P.per_cor2));
% x3 = (1:length(P.per_cor3));
% plot(x1,P.per_cor1,'r');
% plot(x2,P.per_cor2,'g');
% plot(x3,P.per_cor3,'b');
% hold off;

hold on;
x1 = (1:length(W.per_cor1));
x2 = (1:length(W.per_cor2));
x3 = (1:length(W.per_cor3));
plot(x1,W.per_cor1,'r');
plot(x2,W.per_cor2,'g');
plot(x3,W.per_cor3,'b');
hold off;