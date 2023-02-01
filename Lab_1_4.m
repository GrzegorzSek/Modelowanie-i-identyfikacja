%%
clc;
close all;
clear all;

format long; 
X=1; %zmienna inizjalizacyjna
z=11111.2; %liczba zębów
s=100000 ; %liczba próbek
Xn=zeros(1,s); %macierz wynikowa

for i = 1:s
    X = X*z-floor(X*z);
    Xn(1,i)=X;
%     disp(X);
end
%% Zadanie 4
r=rand(1,s);
zad4_Xn = r;
for i=1:s
   if  r(i)<(1/2)
       ksi = -1;
       zad4_Xn(i) = -log(Xn(i))*ksi;
   else
       ksi = 1;
       zad4_Xn(i) = -log(Xn(i))*ksi;
   end
end
figure()
histogram(zad4_Xn)
title(['z = ', num2str(z), ', X_0 = 1, liczba próbek s = 10^5'])
xlabel('Przedziały klasowe wartości wygenerowanych liczb') 
ylabel('Liczebność wystąpień wygenerowanych liczb') 

