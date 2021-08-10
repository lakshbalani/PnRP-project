price = 95;
sp = 105;
r = 0.1;
t = 0.25;
T = xlsread('Stock values.xlsx','F27:F27');
vol = T;
[Call,Put] = blsprice(price,sp,r,t,vol);
Call
Put
