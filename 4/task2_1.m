clc;clear all; close all;

clc; clear all; close all;
global r0 r1 r2 r3 r4 r5 ub;

r0 = 1000; r1 = 9000; r2 = r1; r3 = r1; r4 = r1; r5 = r1;
c1 = 1e-6; c2 = 2e-6; c3 = 3e-6; ub = 6;

u_0 = [0; ub*r1/(r1+r2); ub*r1/(r1+r2); ub; 0];
G = [-c1 c1 0 0 0;c1 -c1 0 0 0;0 0 -c2 0 0;0 0 0 -c3 c3;...
    0 0 0 c3 -c3];
alpha = (1)/2;
t_0 = 0;
t_n = 0.01;
tau = [1 / 1000 1 / 2000 1 / 4000 1/8000 1 / 16000 1 /32000 1 / 64000];
LastP = zeros(length(u_0), length(tau));
for k = 1:1:size(tau, 2)
    [U,t] = Rosenbrock(@F, G, t_0, t_n, u_0, alpha, tau(k));
    LastP(:,k) = U(:,end);
end
color=['r' 'g' 'k' 'y' 'b'];
figure(1); grid on; hold on;
xlabel('Number'); ylabel('Effective order');
title('Plot of effective order');
for i = 1:1:length(u_0)
    S = LastP(i,:);
    for  j =1:1:size(tau,2) - 2
        p(i,j)  = abs(log2((S(j+2) - S(j+1)) / (S(j+1) - S(j))));
    end
    plot(1:size(tau,2) - 2,p(i,:),'Color',color(i))
end
legend('p_u_1','p_u_2','p_u_3','p_u_4','p_u_5')
