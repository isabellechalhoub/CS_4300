function CS4300_demo_perceptron
%

[dl,dnl,indlq,indln,indnlq,indnln] = CS5350_gen_nuke_quake_data;

figure(1);
clf
subplot(2,3,1);
axis equal
plot(dl(:,1),dl(:,2),'ko');
hold on
plot(dl(indlq,1),dl(indlq,2),'g*');
plot(dl(indln,1),dl(indln,2),'r*');

y = zeros(length(dl(:,1)),1);
y(indlq) = 1;

[w,pc] = CS4300_perceptron_learning(dl,y,0.1,3000,0);

x = [3.5:0.1:7.5];
y = (-w(1)-w(2)*x)/w(3);
plot(x,y);
title('Non-noisy Quake/Nuke Data');
xlabel('X');
ylabel('Y');

subplot(2,3,4);
plot(pc);
hold on
plot(0,0,'w.');
xlabel('Iteration Number')
ylabel('Percent Correct')

subplot(2,3,2);
plot(dnl(:,1),dnl(:,2),'ko');
axis equal
hold on
plot(dnl(indnlq,1),dnl(indnlq,2),'g*');
plot(dnl(indnln,1),dnl(indnln,2),'r*');

y = zeros(length(dnl(:,1)),1);
y(indnlq) = 1;

[w,pc] = CS4300_perceptron_learning(dnl,y,0.1,50000,0);

y = (-w(1)-w(2)*x)/w(3);
plot(x,y);
title('Noisy Quake/Nuke Data');
xlabel('X');
ylabel('Y');

subplot(2,3,5);
plot(pc);
hold on
plot(0,0,'w.');
xlabel('Iteration Number')
ylabel('Percent Correct')

subplot(2,3,3);
plot(dnl(:,1),dnl(:,2),'ko');
axis equal
hold on
plot(dnl(indnlq,1),dnl(indnlq,2),'g*');
plot(dnl(indnln,1),dnl(indnln,2),'r*');

y = zeros(length(dnl(:,1)),1);
y(indnlq) = 1;

[w,pc] = CS4300_perceptron_learning(dnl,y,0.1,50000,1);

y = (-w(1)-w(2)*x)/w(3);
plot(x,y);
title('Noisy Data: 1000/(1000+t)');
xlabel('X');
ylabel('Y');

subplot(2,3,6);
plot(pc);
hold on
plot(0,0,'w.');
xlabel('Iteration Number')
ylabel('Percent Correct')

tch = 0;