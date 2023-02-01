%%
clc;
clear all;

format long 
X=rand(); %zmienna inizjalizacyjna
z=11111.9; %liczba zębów
N=1000000; %liczba próbek
Xn=zeros(1,N); %macierz wynikowa

for i = 1:N
    X = X*z-floor(X*z);
    Xn(1,i)=X;
%     disp(X);
end

%% Dystrybuanta odwrotna ZAD1
zad1_Xn = arrayfun(@zad1, Xn);
%% Laboratorium 4 zadanie 2
m=1;
D_N_max=[];
for l=1000:1000:N
    F_N=0;
    F=0;
    k=1;
    for x=0:0.001:1
        sum = 0;
        for i=1:l
            if zad1_Xn(i) <= x
               sum = sum + 1; 
            end
        end
        F_N(1, k)=x;
        F(1, k)= x.^2;
        F_N(2, k)=sum/N;
        k=k+1;
    end
    % Laboratorium 4 zadanie 3
    for i=1:size(F, 2)
       D_N(i)=F_N(2,i)-F(i);
    end
    D_N_max(1,m)=l;
    D_N_max(2,m)=max(abs(D_N));
    m=m+1;
end
%%

figure()
plot(D_N_max(1,:), D_N_max(2,:))
title('D_Nmax(N)')
xlabel('liczba próbek N') 
ylabel('Wartośc maksymalna błędu') 
%% FUNKCJE
function y = zad1(x)
y = x.^(1/2);
end