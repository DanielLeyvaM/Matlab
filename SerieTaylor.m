clc
clear
syms x;
f=(10-10*exp(-x/10));
taylor=0;

%Serie de Taylor
fprintf('Funcion a Utilizar: 10-10*exp(-x/10) \n\n');
xo=input('Ingrese el valor de x: ');
a=input ('Ingrese el valor de a: ');
h=xo-a
n=input('Ingrese Grado del polinomio de Taylor: ');
exacto= subs(10-10*exp(-x/10),xo);

for i=0:1:n
    pause(1)
    fprintf('\n\nDerivada %d: ',i)
    derivada=diff(10-10*exp(-x/10),i);
    fprintf('%s',derivada)
    sustitucion=subs(derivada,a)*(h^i/factorial(i));
    taylor=taylor+sustitucion;
end

%Resultados
pause(1)
fprintf('\n\nEl valor exacto de la Funcion es: %.9f\n\n',exacto);
fprintf('El Resulado del polinomio de Taylor de grado %d es: %.9f' ,n ,taylor); 

ex= abs(exacto);
aprox= abs(taylor);
ER=(ex-aprox)/exacto;
EP=abs(ER)*100;

fprintf('\nEl Porcentaje de Error Respecto al Valor Exacto es: %.6f %\n\n',EP);

%Grafica Función
pause(2)
t=-10:0.1:30;
y=(10-10*exp(-t/10));
plot(t,y,'linewidth',3)
title('Serie de Taylor')
xlabel('Tiempo')
ylabel('Voltaje')
grid
hold on

for i=0:1:n
    derivada=diff(10-10*exp(-x/10),i);
    sustitucion=subs(derivada,a)*(x^i/factorial(i));
    y2=subs(sustitucion,x,t);
    plot(t,y2)
    ylim([-10,10])
    hold on
end

