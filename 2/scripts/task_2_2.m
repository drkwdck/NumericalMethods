clear;
u0 = [1; -0.5; 0.6];
t_start = 0;
t_end = 1;
max_node_count = 7;

u_dimension = length(u0);

last_node_u = zeros(max_node_count, u_dimension);
for i = 1:max_node_count
    [t, u] = runge_kutta('test_function_2', t_start, t_end, u0, 2^(i - 1));
    last_node_u(i,:) = u(length(t), :);
end



order_estimate = zeros(max_node_count - 2, u_dimension);
for i=1:max_node_count - 2
    for j=1:u_dimension
        order_estimate(i, j) = log2((last_node_u(i+2, j) - last_node_u(i+1, j)) / (last_node_u(i+1, j) - last_node_u(i, j))) / log(0.5);        
    end
end

plot(1:5, order_estimate(:, 3))
grid on
title('Оценка порядока метода u3')
ylabel('Эффективный порядок метода')
xlabel('Число узлов сетки')