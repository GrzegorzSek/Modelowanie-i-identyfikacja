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
%% RAND MATLABowy
r=rand(1,s);
%% Dystrybuanta odwrotna ZAD4 - Laplace
b=1;
zad4_Xn = r; % dla rand
%zad4_Xn = Xn;
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
      histogram(result);
% title(['z = ', num2str(z), ', X_0 = 1, liczba próbek s = 10^6'])
% xlabel('Przedziały klasowe wartości wygenerowanych liczb') 
% ylabel('Liczebność wystąpień wygenerowanych liczb')
%% Lab 3 zad 1
    % podpunkt a
sum = 0;
for i=1:size(result, 2)
   sum = sum + result(i);
end
mi_N=sum/size(result, 2);

    % podpunkt b
sum = 0;
for i=1:size(result, 2)
   sum = sum + (result(i) - mi_N).^2;
end
s_N=sum/size(result, 2);

    % podpunkt c
sum = 0;
for i=1:size(result, 2)
   sum = sum + (result(i) - mi_N).^2;
end
S_N=sum/(size(result, 2)-1);

























