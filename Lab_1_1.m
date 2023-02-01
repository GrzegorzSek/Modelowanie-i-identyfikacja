%%
clc;
close all;
clear all;

format long; 
X=1; %zmienna inizjalizacyjna
z=11111.9; %liczba zębów
s=1000000 ; %liczba próbek
Xn=zeros(1,s); %macierz wynikowa

for i = 1:s
    X = X*z-floor(X*z);
    Xn(1,i)=X;
%     disp(X);
end

%% Dystrybuanta odwrotna ZAD1
r=rand(1,s);
% zad1_Xn = arrayfun(@zad1,Xn);
zad1_Xn = arrayfun(@zad1,Xn);
figure()
hold on
histogram(zad1_Xn)
title(['z = ', num2str(z), ', X_0 = 1, liczba próbek s = 10^6'])
xlabel('Przedziały klasowe wartości wygenerowanych liczb') 
ylabel('Liczebność wystąpień wygenerowanych liczb') 

% figure()
% f = @(x) x.^(1/2);
% fplot(f, [0, 1])

%% Okresowość
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
%%
function y = zad1(x)
y = x.^(1/2);
end

