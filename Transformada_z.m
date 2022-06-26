clear all
clc
syms z n

funcion=(-6)^n
TRANSFORMADA=ztrans(funcion);
pretty(TRANSFORMADA)

%Representación Gráfica
t= linspace(0,2*pi,100); 
circ=2*exp(-1i*t)/3;
plot (0,0,'bo',-6,0,'bx',real(circ),imag(circ),'b'); axis equal
hold on

%Representación Función de Transferencia
figure(2)
z=tf('z');
Xz=TRANSFORMADA
[num,den]=tfdata(Xz,'V');
zplane(num,den)


%PROGRAMA USANDO HEAVISIDE U(n)=Escalon Unitario
clear all
clc
syms z n

funcion=dirac(n)+dirac(n-4)
TRANSFORMADA=ztrans(funcion);
pretty(TRANSFORMADA)

%Representación Función de Transferencia
z=tf('z');
Xz=1/z^4+1
[num,den]=tfdata(Xz,'V');
zplane(num,den)