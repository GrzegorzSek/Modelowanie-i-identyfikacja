clc;
close all;
clear all;

    X=rand(); %zmienna inizjalizacyjna
    z=11111.999; %liczba zębów
    N=200000; %liczba próbek
    Xn=zeros(1,N); %macierz wynikowa

    for i = 1:N
        X = X*z-floor(X*z);
        Xn(1,i)=X;
    %     disp(X);
    end

    %% Dystrybuanta odwrotna ZAD2
    r=rand(1,N);
    zad2_Xn = Xn;
%     zad2_Xn = r;
    for i=1:N
       if  Xn(i)<(1/2)
           zad2_Xn(i) = - 1 + sqrt(2*Xn(i));
       else
           zad2_Xn(i) = 1 - sqrt(2-2*Xn(i));
       end
    end
    figure()
    histogram(zad2_Xn)
    title(['z = ', num2str(z), ', X_0 = 1, liczba próbek N = 10^6'])
    xlabel('Przedziały klasowe wartości wygenerowanych liczb') 
    ylabel('Liczebność wystąpień wygenerowanych liczb') 
%% lab 5 zadanie 2
h_N=0.2; %stała h_N - parametr wygładzania
temp_f_x=zad2_Xn(1:N); 
iter=1;
f_x=zeros(1,2001);

for x=-10:0.01:10
    sum=0;
    for i=1:N
        %Jądro Gaussa
        %sum = sum + (1/sqrt(2))*exp(-((zad2_Xn(i)-x)/h_N)^2/2);
        
        %jądro prostokątne
%         if (zad2_Xn(i)-x)/h_N > -0.5 && (zad2_Xn(i)-x)/h_N < 0.5
%             sum = sum + 1;
%         end

        %jądro Epanechnikova
        if (zad2_Xn(i)-x)/h_N < 3/4*(1-((zad2_Xn(i)-x)/h_N)^2) && (zad2_Xn(i)-x)/h_N > -3/4*(1-((zad2_Xn(i)-x)/h_N)^2)
            sum = sum + 1;
        end  
    end
    f_x(iter) = sum / (N*h_N);
    iter = iter + 1;
end

x=-10:0.01:10;
plot(x, f_x)

hold on

fplot(@(x) -x+1,[0 1])
fplot(@(x) x+1,[-1 0])






















