
s=1000000;
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
        histogram(Xn, [-20:0.5:20]);
        title(['z = ', num2str(z), ', X_0 = 1, liczba próbek s = 10^6'])
        xlabel('Przedziały klasowe wartości wygenerowanych liczb') 
        ylabel('Liczebność wystąpień wygenerowanych liczb')