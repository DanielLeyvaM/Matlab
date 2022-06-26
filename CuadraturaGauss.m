clear all
clc
syms x

fprintf('Método de Cuadratura de Gauss');
f=75*sin(x);
fprintf('\nFunción a Integrar: 75*sin(x)\n')
a=input('\nDesde (Límite Inferior): ');
b=input('Hasta (Límite Superior): ');
Exacto=int(f,x,a,b);

%Cuadratura con 2 puntos
Gauss1=((b-a)*(-1/sqrt(3))+b+a)/2;
Gauss2=((b-a)*(1/sqrt(3))+b+a)/2;
Dospuntos=((b-a)/2)*(subs(f,x,Gauss1)+subs(f,x,Gauss2));

ex2= abs(Exacto);
aprox2= abs(Dospuntos);
ER2=(ex2-aprox2)/Exacto;
EP2=abs(ER2)*100;

%Cuadratura con 3 puntos
G1=((b-a)*(-sqrt(3/5))+b+a)/2;
G2=(b+a)/2;
G3=((b-a)*(sqrt(3/5))+b+a)/2;
Trespuntos=((b-a)/2)*((5/9)*subs(f,x,G1)+(8/9)*(subs(f,x,G2))+(5/9)*subs(f,x,G3));

ex3= abs(Exacto);
aprox3= abs(Trespuntos);
ER3=(ex3-aprox3)/Exacto;
EP3=abs(ER3)*100;

%Solución Exacta
fprintf('\n\nSolución Exacta: %.7f ',Exacto)

%Soluciones 
pause(1)
fprintf('\n\nCuadratura de Gauss 2 Puntos: %.6f%',Dospuntos)
fprintf('\nError Porcentual: %.4f ',EP2)
pause(2)
fprintf('\n\nCuadratura de Gauss 3 Puntos: %.6f%',Trespuntos)
fprintf('\nError Porcentual: %.4f \n',EP3)

%Gráfica 
pause(3.2)
t=a:0.1:b;
area(t,subs(f,x,t))
title('Cuadratura de Gauss')
legend('Área bajo la Curva')
hold on
grid on
