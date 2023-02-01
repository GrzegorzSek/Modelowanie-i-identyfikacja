clc;
close all;
clear all;

X=3; %jako X0 - punkt startowy
m=49; %modulo
c=0; %stała C
s=100000; %liczba próbek
a=rand(1,s); %tabela z wartościami a0 do ak
%a=[2;3;4;5];

Xn=zeros(1,s); %deklaracja macierzy wynikowej

for n=1:s
    if n==1
       Xn(1)=mod(a(1)*X+c, m); %obliczanie X1
    else
        x=0;
        for i=1:n
            if i==n
                x=x+a(i)*X;
                continue;
            end
            x=x+a(i)*Xn(n-i);
        end
        Xn(n)=mod(x+c, m);
    end 
end
%% Histogram generatora 2
figure();
histogram(Xn);
title(['m = ', num2str(m), ', X_0 = 3, liczba próbek s = 10^5, stała c = ', num2str(c)])
xlabel('Przedziały klasowe wartości wygenerowanych liczb') 
ylabel('Liczebność wystąpień wygenerowanych liczb') 

%% Test par dla generatora
% z = zeros(1,s-1);
% u = zeros(1,s-1);
% 
% for i=1:(s-1)
%     z(i)=Xn(i);
%     u(i)=Xn(i+1);
% end
% 
% figure()
% plot(z,u,'.');
% title(['m = ', num2str(m), ', X_0 = 3, liczba próbek s = 10^5, stała c = ', num2str(c)])
% xlabel('Wartośc wygenerowanej liczby X_n(i)') 
% ylabel('Wartośc wygenerowanej liczby X_n(i+1)')
