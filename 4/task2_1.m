clear;
clc;
global r0 r1 r2 r3 r4 r5 ub;

r0 = 1000; r1 = 9000; r2 = r1; r3 = r1; r4 = r1; r5 = r1;
c1 = 1e-6; c2 = 2e-6; c3 = 3e-6; ub = 6;
u_0 = [0; ub*r1/(r1+r2); ub*r1/(r1+r2); ub; 0];
G = [-c1 c1 0 0 0;c1 -c1 0 0 0;0 0 -c2 0 0;0 0 0 -c3 c3;...
    0 0 0 c3 -c3];
alpha = (1+ i) / 2;
t_start = 0;
t_end = 0.01;
tau = [1 / 1000 1 / 2000 1 / 4000 1/8000 1 / 16000 1 /32000 1 / 64000];

u_dimension = length(u_0);
lasu_u_values = zeros(u_dimension, length(tau));

for k = 1:1:size(tau, 2)
    [U,t] = rosenbrock(@F, G, t_start, t_end, u_0, alpha, tau(k));
    lasu_u_values(:,k) = U(:,end);
end

grid on;
hold on;
xlabel('Число узлов сетки');
ylabel('Оценка порядока метода');
title(['Эффективный порядок метода alpha = ', num2str(alpha)]);

for i= 1:1:u_dimension
    last_u_value = lasu_u_values(i,:);

    for  j =1:1:size(tau,2) - 2
        order_estimate(i,j)  = abs(log2((last_u_value(j+2) - last_u_value(j+1)) / (last_u_value(j+1) - last_u_value(j))));
    end

    plot(1:size(tau, 2) - 2, order_estimate(i,: ))
end

legend('u_1','u_2','u_3','u_4','u_5');
