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
%%
    % Dmin = 1
    % x+1 dla xc(-1;0]
    % -x+1 dla xc(0;1]
    result=[];
    rejected_samples_counter = 0;
    for i = 2:2:s-1
        U1 = Xn(i-1)*2-1;
        U2 = Xn(i);
        
        if (U1 > -1 && U1 <= 0)
            if U2 <= U1 + 1
                result(end+1) = U1;
            else
                rejected_samples_counter = rejected_samples_counter + 1;
            end
        else
            if U2 <= -U1 + 1
                result(end+1) = U1;
            else
                rejected_samples_counter = rejected_samples_counter + 1;
            end
        end
    end
%% WYŚWIETLANIE WYNIKÓW
histogram(result);
title(['z = ', num2str(z), ', X_0 = 1, liczba próbek s = 10^6'])
xlabel('Przedziały klasowe wartości wygenerowanych liczb') 
ylabel('Liczebność wystąpień wygenerowanych liczb')
%%