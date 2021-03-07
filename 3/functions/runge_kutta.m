function [u] = runge_kutta(u0, t, butcher, a, b)
     u = zeros(size(t, 2), 2) + u0;
     w = zeros(size(butcher, 2), 2);
     
     for i=1:size(u,1) - 1
         tau = t(i+1) - t(i);
         
         for j=1:size(w,1)
             w(j, :) = f3(u(i,:) + tau * (w' * butcher(j,:)')', t(i) + tau * a(j));
         end

         u(i+1, :) = u(i,:) + tau * (w' * b')';
     end
end

