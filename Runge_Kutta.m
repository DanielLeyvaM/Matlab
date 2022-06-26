clear
clc
syms x y

fprintf('Método Runge Kutta Clasico (Orden 4)');
fprintf('\nEcuación a Utilizar:(-1/5)*y+1 \n');
f=(-1/5)*y+1;
pretty(f)

xo=input('Valor inicial de x: '); 
yo=input('Valor inicial de y: ');

xf=input('\nIngrese valor final de x: ');
n=5;
h=(xf-xo)/n

x=[xo:h:xf];

j=0;
for i=1:n+1
    if i==1
        y(i)=yo;
    else
j=j+1;
kx=subs(f,x(j));
k1=subs(kx,y(j));
kx=subs(f,x(j)+(h/2));
k2=subs(kx,y(j)+(h/2)*k1);
kx=subs(f,x(j)+(h/2));
k3=subs(kx,y(j)+(h/2)*k2);
kx=subs(f,x(j)+h);
k4=subs(kx,y(j)+h*k3);
y(i)=y(j)+(h/6)*(k1+2*k2+2*k3+k4);
    end
end

for i=1:n+1
    itera=i-1;
    pause(0.5)
    fprintf('El valor de x en la iteración %d es: %.5f',itera ,x(i))
    fprintf('\nEl valor de y en la iteración %d es: %.5f\n\n',itera ,y(i))
end
runge=y(i);
pause(1)
solucion=dsolve('Dy=(-1/5)*y+1','y(0)=0','x')
exacta=subs(solucion,xf);
pause(1)
fprintf('Solución exacta: %.5f',exacta)

ex= abs(exacta);
aprox= abs(y(i));
ER=(exacta-aprox)/exacta;
EP=abs(ER)*100;
fprintf('\nSolucion Runge-Kutta: %.5f',y(i))
fprintf('\nError porcentual: %.4f\n\n',EP)

pause(5)
t=-2*xf:0.1:2*xf;
plot(t,subs(solucion,t))
grid on
hold on
plot(xf,runge,'*')
hold on
plot(xf,exacta,'o')
hold on
title('Runge - Kutta')
legend('Gráfica','Solución Runge-Kutta','Solución Exacta')