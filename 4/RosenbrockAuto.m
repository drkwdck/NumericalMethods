function [U, t] = RosenbrockAuto(f,G,t_0,t_n, u_0, alpha, tau)
 t = t_0:tau:t_n;
 h = 10^-5;
 U(:,1) = u_0;
 f_u = zeros(size(u_0,1),size(u_0,1));
 for i = 1:1:length(t) - 1    
    for j = 1:1:size(u_0,1)
        dU = zeros(size(u_0));
        dU(j) = h;
        f_u(:,j) = (f(U(:,i) + dU) - f(U(:,i) - dU))/(2*h);
    end
    A = (G - alpha * tau *f_u);    
    B = f(U(:,i));
    omega =linsolve(A,B);
    U(:,i+1) = U(:,i) + tau * real(omega);
 end
end

