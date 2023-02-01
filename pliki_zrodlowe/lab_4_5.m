%%
clc;
close all;
clear all;

format long; 
X=1; %zmienna inizjalizacyjna
z=11111.9; %liczba zębów
N=1000; %liczba próbek
Xn=zeros(1,N); %macierz wynikowa
L=10; %liczba eksperymentów
srednia=zeros(1,10001);
wariancja=zeros(1,10001);

for i = 1:N
    X = X*z-floor(X*z);
    Xn(1,i)=X;
%     disp(X);
end

%% Dystrybuanta odwrotna ZAD1
zad1_Xn = arrayfun(@zad1, Xn);
%% Laboratorium 4 zadanie 2
for m=1:L
    k=1;
    for x=0:0.0001:1
        sum = 0;
        for i=1:N
            if zad1_Xn(i) <= x
               sum = sum + 1; 
            end
        end
        srednia(k)=srednia(k)+sum/N;
        k=k+1;
    end

end
for y=1:size(srednia, 2)
   srednia(y)=srednia(y)/L; 
end

for m=1:L
    k=1;
    for x=0:0.0001:1
        sum = 0;
        for i=1:N
            if zad1_Xn(i) <= x
               sum = sum + 1; 
            end
        end
        d=sum/N;
        wariancja(k) = wariancja(k) + (d-srednia(k))^2;
        k=k+1;
    end
end

for y=1:size(wariancja, 2)
   wariancja(y)=wariancja(y)/L; 
end


x=0:0.0001:1;
plot(x, wariancja)
%% FUNKCJE
function y = zad1(x)
y = x.^(1/2);
end
