%%
clc;
close all;
clear all;

format long; 
X=1; %zmienna inizjalizacyjna
z=11111.9; %liczba zębów
N=100; %liczba próbek
Xn=zeros(1,N); %macierz wynikowa

for i = 1:N
    X = X*z-floor(X*z);
    Xn(1,i)=X;
%     disp(X);
end

%% Dystrybuanta odwrotna ZAD1
zad1_Xn = arrayfun(@zad1, Xn);
%% Laboratorium 4 zadanie 2
k=1;
F=[];
for x=0:0.001:1
    sum = 0;
    for i=1:N
        if zad1_Xn(i) <= x
           sum = sum + 1; 
        end
    end
    F(k)=x.^2;
    F_N(1, k)=x;
    F_N(2, k)=sum/N;
    k=k+1;
end
%% rysowanie wykresów
x=0:0.001:1;
plot(F_N(1, :), F_N(2, :));
hold on
plot(x, F);
%% FUNKCJE
function y = zad1(x)
y = x.^(1/2);
end