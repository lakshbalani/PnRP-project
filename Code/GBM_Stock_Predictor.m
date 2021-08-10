close all;
clc;

t = 1; 
n = 365; % defines the number of the divisions of the time 't'
dt = t/n; % 1 trading unit of time
t_grid = 0:dt:t; % defines the duration of trading
A = randn(1,n); % defines a Gaussian random variable of n values.
dz = sqrt(dt)*A; % describes the Geometric Brownian motion
s_0 = 50; % defines the initial value of the stock.
mu = 0.2; % defines the drift of the equity.
sigma_1 = 0.5; % defines the volatility of the stock.
sigma_2 = 0.1; % defines the volatility of the stock.
sigma_3 = 0.01; % defines the volatility of the stock.

Z = zeros(1,n);% defines an array of n zeros, which will contain the cumulative sum of change in stock price.
X = zeros(1,n);
Y = zeros(1,n);
ds_1 = mu*s_0*dt+sigma_1*s_0*dz; % calculates the change in value of the stock based on the formula used in the Geometric Brownian Model.
ds_2 = mu*s_0*dt+sigma_2*s_0*dz;
ds_3 = mu*s_0*dt+sigma_3*s_0*dz;
Z(1) = ds_1(1); % lines 16-19 contain the cumulative sum of the change in value of the stock over every trading day.
X(1) = ds_2(1);
Y(1) = ds_3(1);
for i = 2:n
    Z(i) = Z(i-1) + ds_1(i);
    X(i) = X(i-1) + ds_2(i);
    Y(i) = Y(i-1) + ds_3(i);
end

st_1 = s_0 + Z; % st_1 shows the value of the stock after 't_grid' days of trading
st_2 = s_0 + X; 
st_3 = s_0 + Y; 

figure(1); % plots the future values of the stock based on given parameters of sigma, mu, ds and dz as used in the equation on line 
plot(t_grid,[s_0,st_1],'-r');
hold on;
plot(t_grid,[s_0,st_2],'-g');
hold on;
plot(t_grid,[s_0,st_3],'-b');

xlabel('Unit of time');
ylabel('Predicted value of stock');

%% As we notice from the plot, as the value of sigma changes from 0.5 to 0.01, the deviations of the stock decreases as the volatility decreases and hence the fluctuations in the values of the stock decreases. 

%% We also notice on changing the mu values the amplitude of the stock increases, hence the maximum value of the stock throughout the trading period increases.
