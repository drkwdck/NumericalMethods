clear
clc
u0 = [1 1];
t = linspace(0, 0.75, 8);
alpha = 0.5;
u = rozenbrok(u0, 0.5, t)

plot(t, u)