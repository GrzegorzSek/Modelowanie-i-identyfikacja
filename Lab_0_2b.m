clc;
close all;
clear all;

k=10;
%X_k=[3, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.12]; %jako X0 - punkt startowy
X_k = rand(1, k);
m=7654; %modulo
c=0; %stała C
s=1000000; %liczba próbek
% a=[1099087573, 2, 3, 4, 5, 6, 7, 8, 9, 10];
a = round(rand(1, k)*10, 0);
 
Xn=zeros(1,s); %deklaracja macierzy wynikowej

for i=1:k
   Xn(1,i) = X_k(i); 
end

for n=k+1:s
    X=0;
    for i=1:k
        X = X+a(i)*Xn(1,n-i)+c;
    end
    Xn(1,n) = round(mod(X, m),2);
end
%% Histogram generatora 2
figure();
histogram(Xn);
title(['m = 5' ', liczba próbek s = 10^6, stała c = ', num2str(c), ', k = ', num2str(k)])
xlabel('Przedziały klasowe wartości wygenerowanych liczb') 
ylabel('Liczebność wystąpień wygenerowanych liczb') 

%% Test par dla generatora
z = zeros(1,s-1);
u = zeros(1,s-1);

for i=1:(s-1)
    z(i)=Xn(i);
    u(i)=Xn(i+1);
end

figure()
plot(z,u,'.');
title(['m = 2^{32}' ', liczba próbek s = 10^4, stała c = ', num2str(c), ', k = ', num2str(k)])
xlabel('Wartośc wygenerowanej liczby X_n(i)') 
ylabel('Wartośc wygenerowanej liczby X_n(i+1)')

% %% Okresowość
O=[];
ii=0;
jj=0;
length=0;
L=[];
P=[];
for i = 1:10
    j=i+1;
    if i == 1
       continue 
    end
    while j < s-i
%         disp(Xn(i));
%         disp(Xn(j));
        if Xn(i) == Xn(j)
            O(end+1)=i;
            P(end+1)=j;
            break
        end
        j=j+1;
    end
    ii=0;
    jj=0;
end