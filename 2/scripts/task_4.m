clear;
u0 = 0.5;
t_start = 0;
t_end = 1;

last_node_u = zeros(7,1);
figure(1)
for i = 1:7
    [t, u] = runge_kutta_unviersal('test_function_1', t_start, t_end, u0, 2^(i - 1));
    last_node_u(i) = u(length(t));
    plot(t, u)
    title('u(t) для разного количества узлов сетки')
    xlabel('t')
    ylabel('u')
    grid on
    hold on
end

for i=1:5
    order_estimate(i) = log((last_node_u(i+2) - last_node_u(i+1)) / (last_node_u(i+1) - last_node_u(i))) / log(0.5);
end

figure(2)
plot([1 2 3 4 5], order_estimate)
grid on
title('Оценка порядока метода')
ylabel('Эффективный порядок метода')
xlabel('Число узлов сетки')