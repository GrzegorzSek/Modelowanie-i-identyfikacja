clc;
close all;

Err_mi_N=zeros(2,10);
Err_s_N=zeros(2,10);
Err_S_N=zeros(2,10);
for k=1:1
    L=k*10; %liczba eksperymentów
        for l=1:L
            X=1; %zmienna inizjalizacyjna
            z=11111.2; %liczba zębów
            s=1000 ; %liczba próbek
            Xn=zeros(1,s); %macierz wynikowa

            for i = 1:s
                X = X*z-floor(X*z);
                Xn(1,i)=X;
            %     disp(X);
            end
            %% Zadanie 4
            x_0=0;
            lambda=1;
            for i=1:s
                Xn(1,i)=x_0+lambda*tan(pi*(Xn(1,i)-1/2));
            end

        %% WYŚWIETLANIE WYNIKÓW
        figure(4)
        histogram(Xn);
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

            % podpunkt b
        sum = 0;
        for m=1:size(Xn, 2)
           sum = sum + (Xn(m) - mi_N).^2;
        end
        s_N=sum/size(Xn, 2);

            % podpunkt c
        sum = 0;
        for m=1:size(Xn, 2)
           sum = sum + (Xn(m) - mi_N).^2;
        end
        S_N=sum/(size(Xn, 2)-1);

        end
    %% lab 3 zadanie 2
    %a
    sum=0;
    for l=1:L
        sum = sum + (mi_N - 0).^2;
    end
        Err_mi_N(1,k)=k;
        Err_mi_N(2,k)=sum/L;
    %b
    sum=0;
    for l=1:L
        sum = sum + (mi_N - 1).^2;
    end
        Err_s_N(1,k)=k;
        Err_s_N(2,k)=sum/L;
    %c
    sum=0;
    for l=1:L
        sum = sum + (mi_N - 1).^2;
    end
        Err_S_N(1,k)=k;
        Err_S_N(2,k)=sum/L;
end
    figure(1)
    plot(Err_mi_N(1,:), Err_mi_N(2,:));
    figure(2)
    plot(Err_s_N(1,:), Err_s_N(2,:));
    figure(3)
    plot(Err_S_N(1,:), Err_S_N(2,:));

