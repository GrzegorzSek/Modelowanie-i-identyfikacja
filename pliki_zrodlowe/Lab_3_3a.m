clc;
close all;
clear all;
K=10; %liczba próbek
Err_mi_N=zeros(2,K);
Err_s_N=zeros(2,K);
Err_S_N=zeros(2,K);
L=10; %liczba eksperymentów
s=1; % liczba próbek (licznik)
for k=1:K
    s=s+10;
        for l=1:L
%% Generacja liczb losowych
            X=rand(); %zmienna inizjalizacyjna
            z=11111; %liczba zębów
            Xn=zeros(1,s); %macierz wynikowa

            for i = 1:s
                X = X*z-floor(X*z);
                Xn(1,i)=X;
            %     disp(X);
            end
%% lab 3 zad 3
            x_0=0;
            lambda=1;
            for i=1:s
                Xn(1,i)=x_0+lambda*tan(pi*(Xn(1,i)-1/2));
            end
        %% WYŚWIETLANIE WYNIKÓW
%               histogram(Xn);
        % title(['z = ', num2str(z), ', X_0 = 1, liczba próbek s = 10^6'])
        % xlabel('Przedziały klasowe wartości wygenerowanych liczb') 
        % ylabel('Liczebność wystąpień wygenerowanych liczb')
        %% Lab 3 zad 1
            % podpunkt a
        sum = 0;
        for m=1:size(Xn, 2)
           sum = sum + Xn(m);
        end
        mi_N=sum/size(Xn, 2);
        Err_mi_N(2,k)=Err_mi_N(2,k)+(mi_N-0)^2;
            % podpunkt b
        sum = 0;
        for m=1:size(Xn, 2)
           sum = sum + (Xn(m) - mi_N)^2;
        end
        s_N=sum/size(Xn, 2);
        Err_s_N(2,k)=Err_s_N(2,k)+(s_N-1)^2;
            % podpunkt c
        sum = 0;
        for m=1:size(Xn, 2)
           sum = sum + (Xn(m) - mi_N)^2;
        end
        S_N=sum/(size(Xn, 2)-1);
        Err_S_N(2,k)=Err_S_N(2,k) + (S_N-1)^2; 
        end
    %% lab 3 zadanie 2
    %a
        Err_mi_N(1,k)=k;
        Err_mi_N(2,k)=Err_mi_N(2,k)/L;
    %b
        Err_s_N(1,k)=k;
        Err_s_N(2,k)=Err_s_N(2,k)/L;
    %c
        Err_S_N(1,k)=k;
        Err_S_N(2,k)=Err_S_N(2,k)/L;
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
    
    plot(Err_S_N(1,:), Err_S_N(2,:), '--');
    legend('Err s_N','Err S_N')

















