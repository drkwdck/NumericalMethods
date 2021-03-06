a=zeros(7,1);
for i=1:7
b=rk45_2('myfun',0,1,0.5,2^(i-1));% delete ; for i grid calculation
a(i)=b(length(b),2);
end
for i=1:5
resa(i)=log((a(i+2)-a(i+1))/(a(i+1)-a(i)))/log(0.5);
end
plot([1 2 3 4 5],resa)