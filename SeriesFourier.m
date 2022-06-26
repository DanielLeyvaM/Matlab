clc
clear
syms x n

f=x^2
a=input('Desde: ')
b=input('Hasta: ')

Ao=(1/b)*int((f),a,b);
An=(1/b)*(int(f*cos((n*pi*x)/b),a,b));
Bn=(1/b)*(int(f*sin((n*pi*x)/b),a,b));
An=subs(An,cos(n*pi),(-1)^n);
An=subs(An,sin(n*pi),0);
Bn=subs(Bn,cos(n*pi),(-1)^n);
Bn=subs(Bn,sin(n*pi),0);

fprintf('Coeficientes de La serie:')
fprintf('\nAo: %s \nAn: %s \nBn: %s\n',Ao,An,Bn)

Fourier=0;
t=input('\n\nCuántos términos quiere aproximar: ')
for n=1:t
    Fourier=Fourier+1/2*subs(Ao,n)+(subs(An,n)*cos((n*pi*x)/b)+subs(Bn,n)*sin((n*pi*x)/b));
    fprintf('\nN= %d: %s',n ,Fourier) 
end

%Gráfica
g=a:0.1:b;
plot(g,subs(f,g))
grid
hold on

Fourier=0;
for n=1:t
    Fourier=Fourier+1/2*subs(Ao,n)+(subs(An,n)*cos((n*pi*x)/b)+subs(Bn,n)*sin((n*pi*x)/b));
    y2=subs(Fourier,g);
    plot(g,y2)
    hold on
end

