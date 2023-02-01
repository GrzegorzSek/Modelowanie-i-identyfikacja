clc;
close all;
clear all;

%% GENERATOR LICZB LOSOWYCH
    X=3; %zmienna inizjalizacyjna
    z=11111.9; %liczba zębów
    s=1000000; %liczba próbek
    Xn=zeros(1,s); %macierz wynikowa

    for i = 1:s
        X = X*z-floor(X*z);
        Xn(1,i)=X;
    %     disp(X);
    end
%%
    % Dmin = 50
    % 50 dla xc(0;1/100]
    % c dla xc(1/100;1]
    c = 50/99; % stała c - 50/99
    result=[];
    samples_l = 0;
    samples_r = 0;
    rejected_samples_counter_l = 0;
    rejected_samples_counter_r = 0;
    for i = 2:2:s-1
        U1 = Xn(i-1);
        U2 = Xn(i)*50;
        
        if (U1 > 0 && U1 <= 1/100)
            samples_l = samples_l + 1;
            if U2 <= U1 + 50
                result(end+1) = U1;
            else
                rejected_samples_counter_l = rejected_samples_counter_l + 1;
            end
        else
            samples_r = samples_r + 1;
            if U2 <= c
                result(end+1) = U1;
            else
                rejected_samples_counter_r = rejected_samples_counter_r + 1;
            end
        end
    end
%% WYŚWIETLANIE WYNIKÓW
    histogram(result);
    title(['z = ', num2str(z), ', X_0 = 1, liczba próbek s = 10^6'])
xlabel('Przedziały klasowe wartości wygenerowanych liczb') 
ylabel('Liczebność wystąpień wygenerowanych liczb')
%%