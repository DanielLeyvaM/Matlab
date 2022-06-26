%Sistema primer orden

%Funcion Transferencia
G=tf([1],[1 5])
%Características
stepinfo(G)
%Grafica de Respuesta escalón Unitario
step(G)
hold on
%Grafica respuesta impulso
%impulse(G)


%Sistema segundo orden
%Cabiando zeta(fator de amortiguamiento--------------
wn=1;
zeta1=0.5;
num= wn^2;
den=[1 2*zeta1*wn wn^2];
G1=tf(num,den)

zeta2=1;
den=[1 2*zeta2*wn wn^2];
G2=tf(num,den)

zeta3=3;
den=[1 2*zeta3*wn wn^2];
G3=tf(num,den)

figure(2)
step(G1,G2,G3)
%--------------------------------------------------

%Cambiando Wn
wn1=1;
zeta=0.9;
num= wn1^2;
den=[1 2*zeta*wn1 wn1^2];
G4=tf(num,den)

wn2=2;
num= wn2^2;
den=[1 2*zeta2*wn2 wn2^2];
G5=tf(num,den)

wn3=5;
num= wn3^2;
den=[1 2*zeta3*wn3 wn3^2];
G6=tf(num,den)

figure(3)
step(G4,G5,G6)








