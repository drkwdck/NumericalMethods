function [u, t] = rosenbrock(f, G, t_start, t_end, u_0, alpha, tau)
    t = t_start:tau:t_end;
    h = 10^-5;
    u(:,1) = u_0;
    f_u = zeros(size(u_0,1), size(u_0, 1));

    for i = 1:1:length(t) - 1    
        for j = 1:1:size(u_0,1)
            dU = zeros(size(u_0));
            dU(j) = h;
            f_u(:,j) = (f(t(i), u(:,i) + dU) - f(t(i), u(:,i) - dU))/(2*h);
        end

        A = (G - alpha * tau *f_u);    
        B = f(t(i) + tau / 2, u(:, i));
        omega = linsolve(A, B);
        u(:, i+1) = u(:, i) + tau * real(omega);
    end
end
