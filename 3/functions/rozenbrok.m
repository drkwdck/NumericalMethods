function [u, t] = rozenbrok(u0, alpha, t)
    h = 10 ^ (-5);
    du = zeros(size(u0));
    u = zeros(size(t, 2), 2) + u0;
    fu = zeros(size(u0, 1), size(u0, 1));

    for i=1:size(t,2)-1
        tau = t(i+1) - t(i);
        i_u = size(u,1) - i + 1;
        for j=1:size(u0, 2)
            for k=1:size(u0, 2)
                du = zeros(size(u0));
                du(j) = h;
                value = (f(u(i,:) + du, t(i)) - f(u(i,:) - du, t(i))) / (2 * h);
                fu(j, k) = value(k);
            end
        end
        w = linsolve((eye(size(fu, 1)) - alpha * tau * fu'), f(u(i, :), t(i) + tau / 2));
        u(i+1,:) = u(i,:) + tau * real(w)';
    end
end
