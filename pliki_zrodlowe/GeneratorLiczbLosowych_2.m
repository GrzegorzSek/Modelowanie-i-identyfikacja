clc;
close all;
clear all;

X=1; %jako X0 - punkt startowy
m=1; %modulo
c=0; %stała C
s=10000; %liczba próbek
a=rand(1,s); %tabela z wartościami a0 do ak
%a=[2;3;4;5];

Xn=zeros(1,s); %deklaracja macierzy wynikowej

for n=1:s
    if n==1
       Xn(1)=mod(a(1)*X+c,m); %obliczanie X1
    else
        x=0;
        for i=1:n
            if i==n
                x=x+a(i)*X;
                continue;
            end
            x=x+a(i)*Xn(n-i);
        end
        Xn(n)=mod(x+c,m);
    end
end

figure();
histogram(Xn);

%% Test par - rozkład jednostajny
z = zeros(1,s-1);
u = zeros(1,s-1);

for i=1:(s-1)
    z(i)=Xn(i);
    u(i)=Xn(i+1);
end
figure();
plot(z,u,'.');

%% Dystrybuanta odwrotna zad1

zad1_Xn = arrayfun(@zad1,Xn);

%% Dystrybuanta odwrotna ZAD2
zad2_Xn = Xn;
for i=1:s
   if  zad2_Xn(i)<(1/2)
       zad2_Xn(i) = sqrt(2*zad2_Xn(i))-1;
   else
       zad2_Xn(i) = 1 + sqrt(-2*zad2_Xn(i)+2);
   end
end
%% Dystrybuanta odwrotna ZAD3
zad3_Xn = Xn;
zad3_Xn = arrayfun(@zad3,zad3_Xn);

figure()
histogram(zad3_Xn)
%% Dystrybuanta odwrotna ZAD4
b=1;
zad4_Xn = Xn;
for i=1:s
   if  zad4_Xn(i)<(1/2)
       zad4_Xn(i) = log(2*zad4_Xn(i))*b;
   elseif zad4_Xn(i)>=(1/2)
       zad4_Xn(i) = log(-2*zad4_Xn(i)+2)*b;
   end
end
figure()
histogram(zad4_Xn)
%% Test par - rozkład zad 1
z = zeros(1,s-1);
u = zeros(1,s-1);

for i=1:(s-1)
    z(i)=zad1_Xn(i);
    u(i)=zad1_Xn(i+1);
end
figure();
plot(z,u,'.');
%% Test par - rozkład zad 2
z = zeros(1,s-1);
u = zeros(1,s-1);

for i=1:(s-1)
    z(i)=zad2_Xn(i);
    u(i)=zad2_Xn(i+1);
end
figure();
plot(z,u,'.');
%% Test par - rozkład zad 3
z = zeros(1,s-1);
u = zeros(1,s-1);

for i=1:(s-1)
    z(i)=zad3_Xn(i);
    u(i)=zad3_Xn(i+1);
end
figure();
plot(z,u,'.');
%% Test par - rozkład zad 4
z = zeros(1,s-1);
u = zeros(1,s-1);

for i=1:(s-1)
    z(i)=zad4_Xn(i);
    u(i)=zad4_Xn(i+1);
end
figure();
plot(z,u,'.');
%% funkcja do Lab 1 zad 1

function y = zad1(x)
y = x.^(1/2);
end
%% zad 3 funkcje
function y = zad3(x)
y = -log(1-x);
end

