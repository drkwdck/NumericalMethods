function  R=rk45_2(f,a,b,ya,M)
w=zeros(length(ya),1);
h=(b-a)/M; 
 Y=zeros(length(ya),M);
T=a:h:b;
Y(:,1)=ya;
    for j=1:M
        w1=h*feval(f,T(j),Y(:,j));
        w2=h*feval(f,T(j)+h/2,Y(:,j)+w1/2);
        w3=h*feval(f,T(j)+h/2,Y(:,j)+w2/2);
        w4=h*feval(f,T(j)+h,Y(:,j)+w3);
        Y(:,j+1)=Y(:,j)+(w1+2*w2+2*w3+w4)/6;
    end
R=[T',Y'];
end