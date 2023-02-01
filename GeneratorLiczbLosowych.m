clc;
close all;
clear all;

X=1; %zmienna inizjalizacyjna
z=111.9; %liczba zębów
s=100000; %liczba próbek
Xn=zeros(1,s); %macierz wynikowa

for i = 1:s
    X = X*z-floor(X*z);
    Xn(1,i)=X;
%     disp(X);
end
%% histogram generatora 1
figure()
histogram(Xn);
title('Histogram - generator 1')
%%
B=sort(Xn);

length=0;
i=1;
while i<s
   if Xn(i) == Xn(i+1) %sprawdza najdłyższy ciąg niepowtarzających się wyrazów
      disp(length);
      break;
   end
   length=length+1;
   i=i+1;
end
% Test par dla generatora
z = zeros(1,s-1);
u = zeros(1,s-1);
%%
for i=1:(s-1)
    z(i)=Xn(i);
    u(i)=Xn(i+1);
end
%% test par dla generatora 1
figure()
plot(z,u,'.');
title('Test par - generator 1')
%% test par dla RAND
r=rand(1,s);

l = zeros(1,s-1);
k = zeros(1,s-1);

for i=1:(s-1)
    l(i)=r(i);
    k(i)=r(i+1);
end
%% test par dla rand
figure()
plot(l,k,'.');
title('Test par - rand')
%% Dystrybuanta odwrotna ZAD1

zad1_Xn = arrayfun(@zad1,Xn);
figure()
histogram(zad1_Xn)
title('Zad 1')
%% Dystrybuanta odwrotna ZAD2
zad2_Xn = Xn;
for i=1:s
   if  Xn(i)<(1/2)
       zad2_Xn(i) = - 1 + sqrt(2*Xn(i));
   else
       zad2_Xn(i) = 1 - sqrt(2-2*Xn(i));
   end
end
figure()
histogram(zad2_Xn)
title('Zad 2')
%% Dystrybuanta odwrotna ZAD3
zad3_Xn = Xn;
zad3_Xn = arrayfun(@zad3,zad3_Xn);

figure()
histogram(zad3_Xn)
title('Zad 3')
%% Dystrybuanta odwrotna ZAD4
b=1;
zad4_Xn = Xn;
for i=1:s
   if  Xn(i)<(1/2)
       zad4_Xn(i) = log(2*Xn(i))*b;
   else
       zad4_Xn(i) = -log(2-2*Xn(i))*b;
   end
end
figure()
histogram(zad4_Xn)
title('Zad 4')
%% Test par - rozkład zad 1
z = zeros(1,s-1);
u = zeros(1,s-1);

for i=1:(s-1)
    z(i)=zad1_Xn(i);
    u(i)=zad1_Xn(i+1);
end
figure();
plot(z,u,'.');
title('Test par - zad 1')
%% Test par - rozkład zad 2
z = zeros(1,s-1);
u = zeros(1,s-1);

for i=1:(s-1)
    z(i)=zad2_Xn(i);
    u(i)=zad2_Xn(i+1);
end
figure();
plot(z,u,'.');
title('Test par - zad 2')
%% Test par - rozkład zad 3
z = zeros(1,s-1);
u = zeros(1,s-1);

for i=1:(s-1)
    z(i)=zad3_Xn(i);
    u(i)=zad3_Xn(i+1);
end
figure();
plot(z,u,'.');
title('Test par - zad 3')
%% Test par - rozkład zad 4
z = zeros(1,s-1);
u = zeros(1,s-1);

for i=1:(s-1)
    z(i)=zad4_Xn(i);
    u(i)=zad4_Xn(i+1);
end
figure();
plot(z,u,'.');
title('Test par - zad 4')
%% ZAD 1 funkcja

function y = zad1(x)
y = x.^(1/2);
end
%% zad 3 funkcje
function y = zad3(x)
y = -log(1-x);
end
%%zad 4 funkcje


%%
%
%Xn=[1,2,3,4,5,1,2,3,9,2];
% ii=0;
% jj=0;
% length=0;
% for i = 1:s
%     j=i+1;
%     while j < s-i
% %         disp(Xn(i));
% %         disp(Xn(j));
%         if Xn(i) == Xn(j)
%             disp(Xn(i));
%             disp(Xn(j));
%             while j+jj<s-i && i+ii<s && Xn(i+ii) == Xn(j+jj)
%                 length=length+1;
%                 
%                 ii=ii+1;
%                 jj=jj+1;
%             end
%             if length ~= 0                
%                 disp(length); 
%             end
%             length=0;
%         end
%         j=j+1;
%     end
%     ii=0;
%     jj=0;
% end
