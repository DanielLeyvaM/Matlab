clear
clc
puntos=input('Ingrese el número de puntos a utilizar: ')
i=1; sumy=0;
syms x z

%Ingresar Puntos a Utilizar
for i=1:puntos
    fprintf('Ingrese el valor %d de x: ',i)
    x(i)=input(' ');
    fprintf('Ingrese el valor %d de f(x): ',i)
    y(i)=input(' ');
    fprintf('\n')
    sumy=sumy+y(i);
end

%Sumatorias
p=input('Ingresa el valor a interpolar: ')
n=input('\nElige el orden del polinomio: ')
orden=1;
repeticion=2*n;
for s=1:repeticion
    sumatoria=0;
    for i=1:puntos
        sumatoria=sumatoria+x(i)^orden;
    end
    xincognitas(s)=sumatoria;
    orden=orden+1;
end

orden=1;
repeticion=n+1;
for s=1:repeticion
    if s==1
        yincognitas(s)=sumy;
    else
        sumatorio=0;
        for i=1:puntos
            sumatorio=sumatorio+(x(i)^orden*y(i));
        end
        yincognitas(s)=sumatorio;
    orden=orden+1;
    end
end
 
%Matriz de x
a=0; i=1;
tam=n+1;
for f=1:tam
   i=i-a;
   for c=1:tam
        if f==1 && c==1
            matx(f,c)=puntos;
        else
            matx(f,c)=xincognitas(i);
            i=i+1;
        end
   end
   a=n;
end

%Matriz de y
i=1;
tam=n+1;
for f=1:tam
   for c=1:1
        maty(f,c)=yincognitas(i);
        i=i+1;
    end
end

pause(1.5)
fprintf('Matriz de x: \n')
for f=1:tam
   for c=1:tam
        fprintf('%d        ',matx(f,c))
   end
   fprintf('\n')
end
pause(1.5)
fprintf('\n\nMatriz de y: \n')
for f=1:tam
   for c=1:1
        fprintf('%d',maty(f,c))
        fprintf('\n')
   end
end
pause(2.1)
soluciones=inv(matx)*maty

%Polinomio
exp=0; Resultado=0; polinomio=0;
for i=1:repeticion
    Resultado=Resultado+(soluciones(i)*(p^exp));
    polinomio=polinomio+(soluciones(i)*(z^exp));
    exp=exp+1;
end

fprintf('\nEl resultado del polinomio de orden %d es: %.5f \n' ,n ,Resultado)

pause(3)
%Gráficas
for i=1:puntos
    plot(x(i),y(i),'*')
    hold on
    grid on
end

t=p-60:0.1:p+60;
plot(t,subs(polinomio,t))
hold on

plot(p,Resultado,'o')
hold on
