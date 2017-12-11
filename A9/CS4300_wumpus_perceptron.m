function [ X,y ] = CS4300_wumpus_perceptron(g,p,w)

load('G.mat');
load('P.mat');
load('W.mat')
im = G(1).im;
im = imresize(im,[15,15]);
im = im > 50;
X(1,:) = im(:);
y(1) = g;

im = G(2).im;
im = imresize(im,[15,15]);
im = im > 50;
X(2,:) = im(:);
y(2) = g;

im = G(3).im;
im = imresize(im,[15,15]);
im = im > 50;
X(3,:) = im(:);
y(3) = g;

im = G(4).im;
im = imresize(im,[15,15]);
im = im > 50;
X(4,:) = im(:);
y(4) = g;

im = G(5).im;
im = imresize(im,[15,15]);
im = im > 50;
X(5,:) = im(:);
y(5) = g;

im = G(6).im;
im = imresize(im,[15,15]);
im = im > 50;
X(6,:) = im(:);
y(6) = g;

im = G(7).im;
im = imresize(im,[15,15]);
im = im > 50;
X(7,:) = im(:);
y(7) = g;

im = G(8).im;
im = imresize(im,[15,15]);
im = im > 50;
X(8,:) = im(:);
y(8) = g;

im = G(9).im;
im = imresize(im,[15,15]);
im = im > 50;
X(9,:) = im(:);
y(9) = g;


%%%%%%

im = P(1).im;
im = imresize(im,[15,15]);
im = im > 50;
X(10,:) = im(:);
y(10) = p;

im = P(2).im;
im = imresize(im,[15,15]);
im = im > 50;
X(11,:) = im(:);
y(11) = p;

im = P(3).im;
im = imresize(im,[15,15]);
im = im > 50;
X(12,:) = im(:);
y(12) = p;

im = P(4).im;
im = imresize(im,[15,15]);
im = im > 50;
X(13,:) = im(:);
y(13) = p;

im = P(5).im;
im = imresize(im,[15,15]);
im = im > 50;
X(14,:) = im(:);
y(14) = p;

im = P(6).im;
im = imresize(im,[15,15]);
im = im > 50;
X(15,:) = im(:);
y(15) = p;

im = P(7).im;
im = imresize(im,[15,15]);
im = im > 50;
X(16,:) = im(:);
y(16) = p;

im = P(8).im;
im = imresize(im,[15,15]);
im = im > 50;
X(17,:) = im(:);
y(17) = p;

im = P(9).im;
im = imresize(im,[15,15]);
im = im > 50;
X(18,:) = im(:);
y(18) = p;

%%%%%%

im = W(1).im;
im = imresize(im,[15,15]);
im = im > 50;
X(19,:) = im(:);
y(19) = w;

im = W(2).im;
im = imresize(im,[15,15]);
im = im > 50;
X(20,:) = im(:);
y(20) = w;

im = W(3).im;
im = imresize(im,[15,15]);
im = im > 50;
X(21,:) = im(:);
y(21) = w;

im = W(4).im;
im = imresize(im,[15,15]);
im = im > 50;
X(22,:) = im(:);
y(22) = w;

im = W(5).im;
im = imresize(im,[15,15]);
im = im > 50;
X(23,:) = im(:);
y(23) = w;

im = W(6).im;
im = imresize(im,[15,15]);
im = im > 50;
X(24,:) = im(:);
y(24) = w;

im = W(7).im;
im = imresize(im,[15,15]);
im = im > 50;
X(25,:) = im(:);
y(25) = w;

im = W(8).im;
im = imresize(im,[15,15]);
im = im > 50;
X(26,:) = im(:);
y(26) = w;

im = W(9).im;
im = imresize(im,[15,15]);
im = im > 50;
X(27,:) = im(:);
y(27) = w;


y = y';
end

