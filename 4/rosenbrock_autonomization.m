function [u, t] = rosenbrock_autonomization(f, G, t_start ,t_end, u_0, alpha, tau)
    t = t_start:tau:t_end;
    h = 10^-5;
    u(:,1) = u_0;
    f_u = zeros(size(u_0,1),size(u_0,1));

    for i = 1:1:length(t) - 1    
        for j = 1:1:size(u_0,1)
            du = zeros(size(u_0));
            du(j) = h;
            f_u(:,j) = (f(u(:,i) + du) - f(u(:,i) - du))/(2*h);
        end

        A = (G - alpha * tau *f_u);    
        B = f(u(:, i));
        omega = linsolve(A, B);
        u(:, i+1) = u(:, i) + tau * real(omega);
    end
end

