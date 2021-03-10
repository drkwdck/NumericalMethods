clear all;
clc , close all;
global r0 r1 r2 r3 r4 r5 ub;

r0 = 1000; r1 = 9000; r2 = r1; r3 = r1; r4 = r1; r5 = r1;
c1 = 1e-6; c2 = 2e-6; c3 = 3e-6; ub = 6;
u_0 = [0; ub*r1/(r1+r2); ub*r1/(r1+r2); ub; 0];
G = [-c1 c1 0 0 0;c1 -c1 0 0 0;0 0 -c2 0 0;0 0 0 -c3 c3;...
    0 0 0 c3 -c3];

alpha = [1/2,(1+1i)/2];
t_0 = 0;
t_n = 0.3;
tau = 1 / 5000;
for k = 1:1:size(alpha,2)
    [U, t] = Rosenbrock(@F, G, t_0, t_n, u_0, alpha(k), tau);
    figure(k); hold on; grid on;
    xlabel('t'); ylabel('u');
    title(['\alpha =  ',num2str(alpha(k))])
    plot(t,U)
    legend('u_1','u_2','u_3','u_4','u_5');
end
