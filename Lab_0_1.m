clc;
close all;
clear all;

X=10; %zmienna inizjalizacyjna
z=111111111.999; %liczba zębów
s=10000 ; %liczba próbek
Xn=zeros(1,s); %macierz wynikowa

for i = 1:s
    X = X*z-floor(X*z);
%     Xn(1,i)=X;
    Xn(1,i)=round(X,4);
%     disp(X);
end
%%Drugi
% X2=0.9
% for i = 1:s
%     X2 = X2*z-floor(X2*z);
%     Xz(1,i)=X2;
%     disp(X);
% end
%% histogram generatora 1
figure(1)
% hold on
histogram(Xn)
% histogram(Xz)
title(['z = ', num2str(z), ', X_0 = 3, liczba próbek s = 10^4'])
xlabel('Przedziały klasowe wartości wygenerowanych liczb') 
ylabel('Liczebność wystąpień wygenerowanych liczb') 

%% Test par dla generatora
w = zeros(1,s-1);
u = zeros(1,s-1);

for i=1:(s-1)
    w(i)=Xn(i);
    u(i)=Xn(i+1);
end

figure(2)
plot(w,u,'.');
title(['z = ', num2str(z), ', X_0 = 3, liczba próbek s = 10^4'])
xlabel('Wartośc wygenerowanej liczby X_n(i)') 
ylabel('Wartośc wygenerowanej liczby X_n(i+1)')

% %% test par dla RAND
% r=rand(1,s);
% 
% l = zeros(1,s-1);
% k = zeros(1,s-1);
% 
% for i=1:(s-1)
%     l(i)=r(i);
%     k(i)=r(i+1);
% end
% 
% figure()
% plot(l,k,'.');
% title('liczba próbek s = 10^6')
% xlabel('Wartośc wygenerowanej liczby X_n(i)') 
% ylabel('Wartośc wygenerowanej liczby X_n(i+1)')
% %% histogram rand
% figure()
% histogram(r);
% title('liczba próbek s = 10^6')
% xlabel('Przedziały klasowe wartości wygenerowanych liczb') 
% ylabel('Liczebność wystąpień wygenerowanych liczb') 
%% okresowośc generatora
%Xn=[1,2,3,4,5,1,2,3,9,2];
%s=10;
O=[];
ii=0;
jj=0;
length=0;
L=[];
P=[];
for i = 1:10
    j=i+1;
    if i == 1
       continue 
    end
    while j < s-i
%         disp(Xn(i));
%         disp(Xn(j));
        if Xn(i) == Xn(j)
            O(end+1)=i;
            P(end+1)=j;
            break
            %disp(Xn(i));
            %disp(Xn(j));
%             while j+jj<s-i && i+ii<s && Xn(i+ii) == Xn(j+jj)
%                 length=length+1;
%                 
%                 ii=ii+1;
%                 jj=jj+1;
%             end
%             if length ~= 0
%                 L(end+1)=length;
%                 %disp(length); 
% %                 if length > 4
% %                     disp(i);
% %                     disp(j);
% %                 end
%             end
%             length=0;
        end
        j=j+1;
    end
    ii=0;
    jj=0;
end
