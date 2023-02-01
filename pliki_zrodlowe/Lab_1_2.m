%%
clc;
close all;
clear all;

% format long; 
% for i=1:10
%     z=1*10^(i)+1.9;
    X=rand(); %zmienna inizjalizacyjna
    z=11111.999; %liczba zębów
    s=1000000 ; %liczba próbek
    Xn=zeros(1,s); %macierz wynikowa

    for i = 1:s
        X = X*z-floor(X*z);
        Xn(1,i)=X;
    %     disp(X);
    end

    %% Dystrybuanta odwrotna ZAD2
    r=rand(1,s);
    zad2_Xn = Xn;
%     zad2_Xn = r;
    for i=1:s
       if  Xn(i)<(1/2)
           zad2_Xn(i) = - 1 + sqrt(2*Xn(i));
       else
           zad2_Xn(i) = 1 - sqrt(2-2*Xn(i));
       end
    end
    figure()
    histogram(zad2_Xn)
    title(['z = ', num2str(z), ', X_0 = 1, liczba próbek s = 10^6'])
    xlabel('Przedziały klasowe wartości wygenerowanych liczb') 
    ylabel('Liczebność wystąpień wygenerowanych liczb') 
% end
% f = @(x) (x >= 0 & x < 1/2) .* (- 1 + sqrt(2*x)) + (x >= 1/2 & x <= 1) .* (1 - sqrt(2-2*x));
% fplot(f, [0, 1])