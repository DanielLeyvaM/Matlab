clear 
clc
syms x;
f=8*sin((1/2)*x)/(2);
i=0;
fprintf('La ecuación a utilizar es: 8*sin(1/2*x)/2)')

%Criterio de Convergencia
while i==0
xo= input('\n\nElige el valor inicial: ')

derivada=diff(f);
sustitucion=abs(subs(derivada,xo));

if sustitucion>=1
    fprintf('Diverge\n\n')
    i=0;
else 
    fprintf('Converge\n\n')
    i=1;
end
end

iteraciones=input('Elige el número de iteraciones: ')
for i=0:iteraciones
    pause(1)
    fprintf('Iteración número %d:\n',i)
    puntofijo=subs(f,xo);
    fprintf('%f\n\n',puntofijo)
    xo=puntofijo;
end
pause(1)
fprintf('El valor de la raíz aproximada "x" es: %.9f',xo)
resultado=subs(8*sin(1/2*x)-2*x,xo);
fprintf('\n\nLa función evaluada en x es: %.5f',resultado)

%Gráfica Función
pause(2)
title('Método Punto Fijo')
t=-10:0.1:10;
plot(t,8*sin(1/2*t)-2*t)
ylim([-5,5])
hold on
plot(xo,0,'*')
hold on
grid
legend('Gráfica Función','Solución encontrada por el Método')
xlabel('Segundos')
ylabel('8 sin(1/2)t)-2t')