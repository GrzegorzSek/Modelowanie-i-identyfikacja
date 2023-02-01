%%
clc;
close all;
clear all;

format long; 
%% wczytywanie danych z pliku 
N=1000; % liczba próbek (maksymalnie 1000)
Xn = dlmread('ModelowanieLab4Data.txt');
%% Laboratorium 4 zadanie 2
k=1;
for x=-5:0.001:5
    sum = 0;
    for i=1:N
        if Xn(i) <= x
           sum = sum + 1; 
        end
    end
    F_N(1, k)=x;
    F_N(2, k)=sum/N;
    k=k+1;
end
%% rysowanie wykresów
plot(F_N(1, :), F_N(2, :))
hold on
% histogram(Xn);
pd = makedist('Normal', 'mu', 1, 'sigma', 1);
x=-5:.001:5;
p=cdf(pd, x);

plot(x,p)

pd2 = makedist('Normal', 'mu', 0, 'sigma', 5);
p2=cdf(pd2, x);

plot(x,p2)

x_0=0;
gamma=1;
Cauchy=[];
for x=-5:.001:5
   Cauchy(end+1)=(1/pi) * atan((x-x_0)/gamma) + 1/2; 
end

x=-5:.001:5;
plot(x,Cauchy)
legend('niewiadoma','normalny(0,1)','normalny(0,5)','cauchy');