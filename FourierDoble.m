clc
clear
syms x n

%Integral 1
f=-1*x^0
a=input('Desde: ')
b=input('Hasta: ')

%Integral 2
g=1*x^0
c=input('Desde: ')
d=input('Hasta: ')

Ao=(1/d)*((int((f),a,b))+((int((g),c,d))));
An=(1/d)*(int((f*cos((n*pi*x)/d)),a,b)+(int((g*cos((n*pi*x)/d)),c,d)));
Bn=(1/d)*(int((f*sin((n*pi*x)/d)),a,b)+(int((g*cos((n*pi*x)/d)),c,d)));
An=subs(An,cos(n*pi),(-1)^n);
An=subs(An,sin(n*pi),0);
Bn=subs(Bn,cos(n*pi),(-1)^n);
Bn=subs(Bn,sin(n*pi),0);

fprintf('Coeficientes de La serie:')
fprintf('\nAo: %s \nAn: %s \nBn: %s\n',Ao,An,Bn)

Fourier=0;
t=input('\n\nCuántos términos quiere aproximar: ')
for n=1:t
    Fourier=Fourier+1/2*subs(Ao,n)+(subs(An,n)*cos((n*pi*x)/d)+subs(Bn,n)*sin((n*pi*x)/d));
    fprintf('\nN= %d: %s',n ,Fourier) 
end

%Gráfica
w=a:0.1:b;
plot(w,subs(f,w))
hold on
plot(w,subs(g,w))
grid
hold on

Fourier=0;
for n=1:t
    Fourier=Fourier+1/2*subs(Ao,n)+(subs(An,n)*cos((n*pi*x)/d)+subs(Bn,n)*sin((n*pi*x)/d));
    y2=subs(Fourier,w);
    plot(w,y2)
    hold on
end
