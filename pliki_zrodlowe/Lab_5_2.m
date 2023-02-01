clc;
close all;
clear all;

%% GENERATOR LICZB LOSOWYCH
    X=1; %zmienna inizjalizacyjna
    z=11111.9; %liczba zębów
    s=1000000; %liczba próbek
    Xn=zeros(1,s); %macierz wynikowa

    for i = 1:s
        X = X*z-floor(X*z);
        Xn(1,i)=X;
    %     disp(X);
    end
%% RAND MATLABowy
r=rand(1,s);
%% Dystrybuanta odwrotna ZAD4 - Laplace
b=1;
%zad4_Xn = r; % dla rand
r=rand(1,s);
zad4_Xn = Xn;
for i=1:s
   if  r(i)<(1/2)
       ksi = -1;
       zad4_Xn(i) = -log(Xn(i))*ksi;
   else
       ksi = 1;
       zad4_Xn(i) = -log(Xn(i))*ksi;
   end
end

%%
%     %  rozklad laplacea
%     % |V| <= sqrt(-2*log(U))+1
     result=[];
     rejected_samples_counter = 0;
    for i = 1:s
        V = zad4_Xn(i);
        U = Xn(i);
        %U = r(i); % dla rand
        
        if V <= sqrt(-2*log(U))+1 && V >= -(sqrt(-2*log(U))+1)
            result(end+1) = V;
        else
            rejected_samples_counter = rejected_samples_counter + 1;
        end
    end
%% lab 5 zadanie 1
result = result + 1; % rozkład normalny N(1,1)
%% lab 5 zadanie 2
N=200000; %liczba próbek
h_N=0.99; %stała h_N - parametr wygładzania
temp_f_x=result(1:N); 
iter=1;
f_x=zeros(1,201);

for x=0:0.01:2
    sum=0;
    for i=1:N
        if (result(i)-x)/h_N > -0.5 && (result(i)-x)/h_N < 0.5
            sum = sum + 1;
        end
    end
    f_x(iter) = sum / (N*h_N);
    iter = iter + 1;
end

x=0:0.01:2;
plot(x, f_x)

hold on

y = normpdf(x,1,1); %rozklad normalny
plot(x, y)






















