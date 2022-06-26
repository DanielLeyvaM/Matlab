clc
clear
syms x a 
%Series de Taylor
pretty(taylor(1/(1+x^2),x,1,'Order',8))
pretty(taylor(cos(x)+sin(x),x,pi,'Order',8))
pretty(taylor(exp(2*x),x,1,'Order',8))
pretty(taylor(exp(1i*x),x,1,'Order',8))

%Series de Maclaurin
pretty(taylor((exp(x)+exp(-x))/2,x,0,'Order',8))
pretty(taylor((exp(x)-exp(-x))/2,x,0,'Order',8))

%Series de Fourier
syms t n
%Limites
A= [-pi/2 pi/2 (3*pi)/2];
%Funciones
f=[x pi-x];

f=sym(f);
T=max(A) -min(A);
wo=2*pi/T;

Ao=0;
for i=1:length(f)
    Ao=Ao+int(f(i),'t',A(i),A(i+1));
end
Ao=simplify(Ao/(T/2))

An=0;
for i=1:length(f)
    An=An+int(f(i)*cos(n*wo*t),A(i),A(i+1));
end
An=simplify(2*An/T)

Bn=0;
for i=1:length(f)
    Bn=Bn+int(f(i)*sin(n*wo*t),A(i),A(i+1));
end
Bn=simplify(2*Bn/T)


syms t n
%Limites
A= [-pi 0 pi];
%Funciones
f=[x+pi x-pi];

f=sym(f);
T=max(A) -min(A);
wo=2*pi/T;

Ao=0;
for i=1:length(f)
    Ao=Ao+int(f(i),'t',A(i),A(i+1));
end
Ao=simplify(Ao/(T/2))

An=0;
for i=1:length(f)
    An=An+int(f(i)*cos(n*wo*t),A(i),A(i+1));
end
An=simplify(2*An/T)

Bn=0;
for i=1:length(f)
    Bn=Bn+int(f(i)*sin(n*wo*t),A(i),A(i+1));
end
Bn=simplify(2*Bn/T)


syms t n
%Limites
A= [-3 0 3];
%Funciones
f=[1 2];

f=sym(f);
T=max(A) -min(A);
wo=2*pi/T;
Ao=0;
for i=1:length(f)
    Ao=Ao+int(f(i),'t',A(i),A(i+1));
end
Ao=simplify(Ao/(T/2))

An=0;
for i=1:length(f)
    An=An+int(f(i)*cos(n*wo*t),A(i),A(i+1));
end
An=simplify(2*An/T)

Bn=0;
for i=1:length(f)
    Bn=Bn+int(f(i)*sin(n*wo*t),A(i),A(i+1));
end
Bn=simplify(2*Bn/T)
