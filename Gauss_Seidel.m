clc;
clear;
syms a b c d

fprintf('Sistema de Ecuaciones a Resolver: \n\n')
fprintf('Ecuación 1: -20a+6b+10d= -50\n')
fprintf('Ecuación 2: 6a-14b+6c= 30\n')
fprintf('Ecuación 3: 6b-9c= -60\n')
fprintf('Ecuación 4: 10a-22d= 15\n')

pause(1)
vector=[-20,6,0,10; 6,-14,6,0; 0,6,-9,0; 10,0,0,-22]
conv=abs(vector);

if conv(1,1)>conv(1,2)+conv(1,3)+conv(1,4)
if conv(2,2)>conv(2,1)+conv(2,3)+conv(2,4)
if conv(3,3)>conv(3,1)+conv(3,2)+conv(3,4)
if conv(4,4)>conv(4,1)+conv(4,2)+conv(4,3)
    fprintf('Cumple el criterio de convergencia\n\n')
end
end
end
else 
    fprintf('No cumple el criterio de convergencia\n\n')
end

pause(1.5)
fprintf('Ecuaciones Despejadas\n')
v=[-1/20*(-50-6*b-10*d), -1/14*(30-6*a-6*c), -1/9*(-60-6*b), -1/22*(15-10*a)];
x=0; y=0; z=0; w=0;n=1;
for i=1:4
    fprintf('%s\n',v(i))
end

iteraciones=input('\nIngresa el número de Iteraciones: ')
for n=1:iteraciones
    i=1;
    while i==1
        x=subs(v(i),a,x);
        x=subs(x,b,y);
        x=subs(x,c,z);
        x=subs(x,d,w);
        i=i+1;
    end
    while i==2
        y=subs(v(i),b,y);
        y=subs(y,a,x);
        y=subs(y,c,z);
        y=subs(y,d,w);
        i=i+1;
    end
    while i==3
        z=subs(v(i),c,z);
        z=subs(z,a,x);
        z=subs(z,b,y);
        z=subs(z,d,w);
        i=i+1;
    end
    while i==4
        w=subs(v(i),d,w); 
        w=subs(w,a,x);
        w=subs(w,b,y);
        w=subs(w,c,z);
        i=i+1;
    end
    pause(0.5)
    fprintf('\nEl valor de a después de %d iteraciones es: %f',n ,x)
    fprintf('\nEl valor de b después de %d iteraciones es: %f',n ,y)
    fprintf('\nEl valor de c después de %d iteraciones es: %f',n ,z)
    fprintf('\nEl valor de d después de %d iteraciones es: %f\n',n ,w)
end  
