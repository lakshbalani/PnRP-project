close all;

mu = 0.5;%expectation
sigma = 1;%deviation
pd = makedist('Normal','mu',mu,'sigma',sigma);
x = -5:0.01:5;
figure();
plot(x,pdf(pd,x));
grid on;
title('Gaussian Distribution (\mu = 0.5 , \sigma = 1)');
