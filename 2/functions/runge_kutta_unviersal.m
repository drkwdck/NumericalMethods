function  [t, u] = runge_kutta_unviersal(f, tstart, tstop, u0, N)
butcher = [0     0      0 0 0 0 0;...
           4/7     0      0 0 0 0 0;...
           115/112 -5/16      0 0 0 0 0;...
           589/630  5/18 -16/45 0 0 0 0;...
           229/1200-29/6000*5^0.5 119/240-187/1200*5^0.5 -14/75+34/375*5^0.5 -3/100*5^0.5 0 0 0;...
           71/2400-587/12000*5^0.5 187/480-391/2400*5^0.5 -38/75+26/375*5^0.5 27/80-3/400*5^0.5 (1+5^0.5)/4 0 0;...
           -49/480+43/160*5^0.5 -425/96+51/32*5^0.5 52/15-4/5*5^0.5 -27/16+3/16*5^0.5 5/4-3/4*5^0.5 5/2-0.5*5^0.5 0];
        
        a = [0 4/7 5/7 6/7 (5-5^0.5)/10 (5+5^0.5)/10 1];
        b = [1/12 0 0 0 5/12 5/12 1/12];

        butcher_matrix_size = length(butcher)
        w = zeros(length(u0), butcher_matrix_size);

        u = zeros(length(u0), N);
        u(:,1) = u0;

        h = (tstop - tstart) / N;
        t = tstart:h:tstop;

        for j=1:N

                for i=1:butcher_matrix_size 
                        w(:,i) = h * feval(f, t(j) + h * a(i), u(:,j) + sum((w .* butcher(i,:))')');
                end

                u(:, j+1) = u(:, j) + sum((w .* b)')';
        end

        t = t';
        u = u';
        hold on
end