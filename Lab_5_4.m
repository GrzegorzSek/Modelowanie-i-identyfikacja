clc;
close all;
clear all;

M=2001; % liczba punktów x
L=1; % liczba eksperymentów
N=500; %liczba próbek
Error=[];
h_N=0.1:0.01:3;
h_iter=1;
for h=0.1:size(h_N, 2)
    sum_L=0; %suma błędów wszystkich eksperymentów dla danego h_N
    for l=1:L
        sum_M=0; %suma błędów dla danego L
        %% GENERATOR LICZB LOSOWYCH
            X=rand(); %zmienna inizjalizacyjna
            z=11111.9; %liczba zębów
            s=1000000; %liczba próbek
            Xn=zeros(1,s); %macierz wynikowa

            for i = 1:s
                X = X*z-floor(X*z);
                Xn(1,i)=X;
            %     disp(X);
            end
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
        temp_f_x=result(1:N); 
        iter=1;
        f_x=zeros(1,2001);

        for x=-10:0.01:10 % To jest ta pętla dla MMMMMMMMMMMMMMMMMMM
            sum=0;
            for i=1:N
                %Jądro Gaussa
                %sum = sum + (1/sqrt(2))*exp(-((result(i)-x)/h_N(h_iter))^2/2);

                %jądro prostokątne
        %         if (result(i)-x)/h_N(h_iter) > -0.5 && (result(i)-x)/h_N(h_iter) < 0.5
        %             sum = sum + 1;
        %         end

                %jądro Epanechnikova
                if (result(i)-x)/h_N(h_iter) < 3/4*(1-((result(i)-x)/h_N(h_iter))^2) && (result(i)-x)/h_N(h_iter) > -3/4*(1-((result(i)-x)/h_N(h_iter))^2)
                    sum = sum + 1;
                end  
            end
            f_x(iter) = sum / (N*h_N(h_iter));
            %zadanie 4
            sum_M = sum_M + (f_x(iter) - (1/(1*sqrt(2*pi)))*exp(-(x-1)^2/(2)))^2;
            %zadanie 4
            iter = iter + 1;
        end
    
        sum_L = sum_L + sum_M;
    end
    Error(h_iter, 2) = sum_L/(L*M);
    Error(h_iter, 1) = h_N(h_iter);
    h_iter=h_iter+1;
end

plot(Error(:, 1), Error(:, 2))




















