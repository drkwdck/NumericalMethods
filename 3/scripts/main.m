clear
clc
% начальная точка
u0 = [1 1];
% ось t
t = linspace(0, 0.75, 8);

% различные значения альфа, для которых будем запускать метод (взяты из
% задания)
alphas =[0.5 1 (1+i)/2];

figure(1)
hold on
grid on
% массив кривых на графике
plots = [];
% массив подписей для каждого элемента из массива plots
plots_lables = strings(size(alphas, 2) * 2);

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

% выводим легенду
legend(plots, plots_lables)



