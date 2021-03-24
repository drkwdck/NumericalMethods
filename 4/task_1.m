clear;
clc;
global r0 r1 r2 r3 r4 r5 ub;

r0 = 1000; r1 = 9000; r2 = r1; r3 = r1; r4 = r1; r5 = r1;
c1 = 1e-6; c2 = 2e-6; c3 = 3e-6; ub = 6;
u_0 = [0; ub * r1 / (r1 + r2); ub * r1 / (r1 + r2); ub; 0];
G = [-c1 c1 0 0 0;c1 -c1 0 0 0;0 0 -c2 0 0;0 0 0 -c3 c3;...
    0 0 0 c3 -c3];

alpha = [1/2, (1 + i) / 2];
t_start = 0;
t_end = 0.01;
h = 1 / 5000;

[U, t] = rosenbrock(@F, G, t_start, t_end, u_0, alpha(1), h);
xlabel('t');
ylabel('u');
title(['\alpha =  ',num2str(alpha(1))])
plot(t,U, '--')

grid on;
hold on;

[U, t] = rosenbrock(@F, G, t_start, t_end, u_0, alpha(2), h);
xlabel('t');
ylabel('u');
title(['\alpha =  ',num2str(alpha(2))])
plot(t,U)

legend('u_1, alpha = 1 / 2','u_2, alpha = 1 / 2 ','u_3, alpha = 1 / 2',...
    'u_4, alpha = 1 / 2','u_5, alpha = 1 / 2','u_1, alpha = (1 + i) / 2',...
    'u_2, alpha = (1 + i) / 2','u_3, alpha = (1 + i) / 2',...
    'u_4, alpha = (1 + i) / 2','u_5, alpha = (1 + i) / 2');
