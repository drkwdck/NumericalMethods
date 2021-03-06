a=zeros(7,3)
for i=1:7
b=rk45_2('myfun',0,1,[1;-0.5;0.6],2^(i-1))%grid i calculation
end

