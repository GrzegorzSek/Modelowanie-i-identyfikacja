%%
clc;
close all;
clear all;

format long; 
X=1; %zmienna inizjalizacyjna
z=11.2; %liczba zębów
s=10000; %liczba próbek
Xn=zeros(1,s); %macierz wynikowa

for i = 1:s
    X = X*z-floor(X*z);
    Xn(1,i)=X;
%     disp(X);
end
%% Dystrybuanta odwrotna ZAD3
r=rand(1,s);
zad3_Xn = Xn;
zad3_Xn = arrayfun(@zad3,zad3_Xn);

figure()
histogram(zad3_Xn)
title(['z = ', num2str(z), ', X_0 = 1, liczba próbek s = 10^6'])
xlabel('Przedziały klasowe wartości wygenerowanych liczb') 
ylabel('Liczebność wystąpień wygenerowanych liczb') 

% figure()
% f = @(x) -log(1-x);
% fplot(f, [0, 1])

%% zad 3 funkcje
function y = zad3(x)
y = -log(1-x);
end