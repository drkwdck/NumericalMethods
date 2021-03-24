clear; 
clc;

global N h k0 k1 x fun
fun = @(x) 100*exp(-(10*(x-0.5)).^2);

a = -1;
b = 1;
N = 128;
h = (b - a) / N;
x = a:h:b;

epsilon = 10^(-12);

k0 = 1;
k1 = 0;
u = zeros(size(x, 2), 1);

values = zeros(N+1);
dx = 2^10;

while(abs(dx) > epsilon)
        for j = 2:N
            du = zeros(N+1, 1);
            du(j) = h;
            values(:, j) = (finite_difference_method(u + du) - finite_difference_method(u - du)) / (2 * h);
        end

    values(1,1) = 1;
    values(N+1, N+1) = 1;
    dx = values \ (-finite_difference_method(u));
    u = u + dx;
end

plot(x, u)
grid on; 