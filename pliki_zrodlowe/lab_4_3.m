%%
clc;
clear all;

format long 
X=rand(); %zmienna inizjalizacyjna
z=11111.9; %liczba zębów
N=10000; %liczba próbek
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
for x=0:0.0001:1
    sum = 0;
    for i=1:N
        if zad1_Xn(i) <= x
           sum = sum + 1; 
        end
    end
    F_N(1, k)=x;
    F(1, k)= x.^2;
    F_N(1, k)=x;
    F_N(2, k)=sum/N;
    k=k+1;
end
%% Laboratorium 4 zadanie 3
    for i=1:size(F, 2)
       D_N(i)=F_N(2,i)-F(i);
    end
    
D_N_max=max(abs(D_N));
%% FUNKCJE
function y = zad1(x)
y = x.^(1/2);
end