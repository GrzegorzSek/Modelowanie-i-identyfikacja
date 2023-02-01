x_0=0;
gamma=1;
Cauchy=[];
for x=-5:.001:5
   Cauchy(end+1)=(1/pi) * atan((x-x_0)/gamma) + 1/2; 
end

x=-5:.001:5;
plot(x,Cauchy)