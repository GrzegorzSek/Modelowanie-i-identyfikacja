clc;
close all;
clear all;
K=100; %liczba próbek
Err_mi_N=zeros(2,K);
Err_s_N=zeros(2,K);
Err_S_N2=zeros(2,K);
plot_s_N=zeros(2,K);
plot_S_N=zeros(2,K);
L=20; %liczba eksperymentów
s=2; % liczba próbek (licznik)
for k=1:K
    s=s+1;
        for l=1:L
        %% GENERATOR LICZB LOSOWYCH
            X=rand(); %zmienna inizjalizacyjna
            z=11111.999; %liczba zębów
            Xn=zeros(1,s); %macierz wynikowa

            for i = 1:s
                X = X*z-floor(X*z);
                Xn(1,i)=X;
            %     disp(X);
            end
        %% RAND MATLABowy
        %% Dystrybuanta odwrotna ZAD4 - Laplace
    %     zad4_Xn = r; % dla rand
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
        %% WYŚWIETLANIE WYNIKÓW
%              histogram(result);
        % title(['z = ', num2str(z), ', X_0 = 1, liczba próbek s = 10^6'])
        % xlabel('Przedziały klasowe wartości wygenerowanych liczb') 
        % ylabel('Liczebność wystąpień wygenerowanych liczb')
        %% Lab 3 zad 1
            % podpunkt a
        sum = 0;
        for m=1:size(result, 2)
           sum = sum + result(m);
        end
        mi_N=sum/size(result, 2);
        Err_mi_N(2,k)=Err_mi_N(2,k)+(mi_N-0)^2;
            % podpunkt b
        sum = 0;
        for m=1:size(result, 2)
           sum = sum + (result(m) - mi_N)^2;
        end
        s_N=sum/size(result, 2);
        Err_s_N(2,k)=Err_s_N(2,k)+(s_N-1)^2;
            % podpunkt c
        sum = 0;
        for m=1:size(result, 2)
           sum = sum + (result(m) - mi_N)^2;
        end
        S_N=sum/(size(result, 2)-1);
        Err_S_N2(2,k)=Err_S_N2(2,k) + (S_N-1)^2;     

        end
    %% lab 3 zadanie 2
    %a
        
        Err_mi_N(1,k)=k;
        Err_mi_N(2,k)=Err_mi_N(2,k)/L;
    %b
        Err_s_N(1,k)=k;
        Err_s_N(2,k)=Err_s_N(2,k)/L;
    %c
        Err_S_N2(1,k)=k;
        Err_S_N2(2,k)=Err_S_N2(2,k)/L;
    %d
    plot_s_N(1,k)=k;
    plot_S_N(1,k)=k;
    plot_s_N(2,k)=s_N;
    plot_S_N(2,k)=S_N;
end
    figure(1)
    plot(Err_mi_N(1,:), Err_mi_N(2,:));
    title('Err mi_N')
    xlabel('N') 
    ylabel('Err')
    
    figure(2)
    plot(Err_s_N(1,:), Err_s_N(2,:));
    hold on
    title('Err s_N')
    xlabel('N') 
    ylabel('Err')
    
    plot(Err_S_N2(1,:), Err_S_N2(2,:), '--');
    legend('Err s_N','Err S_N')

    figure(3)
    plot(plot_s_N(1,:), plot_s_N(2,:));
    hold on
    plot(plot_S_N(1,:), plot_S_N(2,:), '--');
    legend('s_N','S_N')
    hold off















