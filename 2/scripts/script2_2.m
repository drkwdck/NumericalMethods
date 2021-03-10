a = zeros(7,3)

for i = 1:7
    b = runge_kutta('test_function_1', 0, 1, [1;-0.5;0.6], 2^(i-1))
end

