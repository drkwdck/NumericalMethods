function  [t, u] = runge_kutta(f, t_start, t_end, u0, N)
    % создаём матрицу промежуточных результатов
    w = zeros(length(u0), 1);

    % Инициализируем u
    u = zeros(length(u0), N);
    u(:, 1) = u0;

    % Вычисляем шаг по оси t и создаём эту ось
    h = (t_end - t_start) / N; 
    t = t_start:h:t_end;

    for j = 1:N
            w1 = h * feval(f, t(j),  u(:,j));
            w2 = h * feval(f, t(j) + h / 2, u(:,j) + w1 / 2);
            w3 = h * feval(f, t(j) + h / 2, u(:,j) + w2 / 2);
            w4 = h * feval(f, t(j) + h, u(:,j) + w3);
            u(:, j+1) = u(:, j) + (w1 + 2 * w2 + 2 * w3 + w4) / 6;
    end

    t = t';
    u = u';
end