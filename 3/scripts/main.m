clear
clc

%   Параметры для обоих методов
% начальная точка
u0 = [1 1];

% шаг по tau
tau = 1/128;

% ось t
t = 0:tau:0.75;

% Методом Рунге Кутта
% Параметры для метода (заданы в методичеке)
a = [0 0.5];
b = [0 1];
butcher = [0 0; 0.5 0];

% Запуск метода Рунге Кутта
u = runge_kutta(u0, t, butcher, a, b);

% Строим, записывая в перменные кривый и их названия, чтобы потом залить
% все на легенду. Так как u - двумерная, строим график для каждой компоненты отдельно
rk_plot(1) = plot(t, u(:,1));
hold on
grid on
rk_plot(2) = plot(t, u(:,2));
rk_label = strings(2);
rk_label(1) = "runge\_kutta(1)";
rk_label(2) = "runge\_kutta(2)";


%   Розенброк
% различные значения альфа, для которых будем запускать метод (взяты из
% задания)
alphas =[0.5 1 (1+i)/2];

%массив кривых на графике
plots = [];

% массив подписей для каждого элемента из массива plots
plots_lables = strings(size(alphas, 2) * 2);

% Проводим вычисления для каждого альфа
for j=1:3
    % считаем значения для u
    u = rozenbrok(u0, alphas(j), t);

    % так как u - двумерная, строим график для каждой компоненты отдельно
    u1 = plot(t, u(:,1), '--');
    u2 = plot(t, u(:,2), '--');

    % формируем подписи для кривых на графике (легенда)
    label1 = "rozenbork(1) " + alphas(j);
    label2 = "rozenbork(2) " + alphas(j);
    plots(j + j - 1) = u1;
    plots(j + j) = u2;
    plots_lables(j + j -1) = label1;
    plots_lables(j + j) = label2;
end

% Добавляем в легендку подписи для метода Рунге Кутта
plots(j + j + 1) = rk_plot(1);
plots(j + j + 2) = rk_plot(2);
plots_lables(j+j+1) = rk_label(1);
plots_lables(j + j + 2) = rk_label(2);

% выводим легенду
legend(plots, plots_lables)
axis equal

