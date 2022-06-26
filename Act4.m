%Actividad 4 - - Filtro De audio
clc; close all hidden; clear all
fprintf('Buenos días gente\n')%CR. Ehecatl
%disp('Presione Enter para comenzar la grabación')
% pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%GRABACIÓN DE AUDIO 
% Fs=44100; %se especifica la frecuencia de grabación
% duracion=3;
% bits=16;
% canales=1;
% grabacion1 = audiorecorder(Fs,bits,canales); %grabación a 16 bits y un sólo canal de audio
% disp('Comienza a hablar.') %se despliega un mensaje para empezar a grabar
% recordblocking(grabacion1, duracion); %grabar durante 3 segundos
% disp('Fin de la grabacion 1.'); %desplegar un mensaje al terminar a grabar
% audio1=getaudiodata(grabacion1); %cargar el audio grabado a un vector
% audiowrite('C:\Users\Daniel Leyva\Documents\Daniel\CUCEI\6° Semestre\Procesamiento de Señales\Act4.wav',audio1,Fs); %guardar la información del vector en un archivo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tipo=input(' 1. PASA BAJAS\n 2. PASA ALTAS\n\n Ingrese tipo de filtro: ');
f=input(' Ingrese orden de filtro: ');

%%LEER ARCHIVO DE AUDIO%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[mensaje,Fs] = audioread('Act4.wav');
%%NORMALIZAR AUDIO%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mensaje = mensaje/max(abs(mensaje));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%ESPECTRO DE LA SEÑAL ORIGINAL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
transformada=abs(fft(mensaje));
L=length(transformada);
espectro=transformada(1:L/2);
maximo=max(espectro);
espectro=espectro/maximo;
frecuencias=Fs*(1:(L/2))/L;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%ETAPA DE FILTRADO%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T=1; %periodo de muestreo
fc=500; %frecuencia de corte
fnyq=Fs/2; %frecuencia de Nyquist
fnorm=fc/(fnyq); %frecuencia normalizada
tau=1/(2*pi*fnorm); %tau del filtro

if (tipo==1)
funcion=abs(1./(i*(frecuencias/fc)+1));
nums=[1]; %numerador de la función de transformadaferencia del filtro
dens=[tau,1]; %denominador de la función de transformadaferencia del fitro
else
   funcion=abs((frecuencias/fc)./(i*(frecuencias/fc)+1)); %Cambiarla por la pasa altas
   nums=[tau,0]; %numerador de la función de transformadaferencia del filtro
   dens=[tau,1]; %denominador de la función de transformadaferencia del fitro
end

nums1=0;
dens1=0;
nums1=nums;
dens1=dens;
funcion1=funcion;

if(f==1);
    funcion;
    nums;
    dens;
else
for i=2:f
    funcion=funcion1.*funcion;
    nums=conv(nums1,nums);
    dens=conv(dens1,dens);
end
end

funcion=funcion/max(funcion);
[numz, denz] = bilinear(nums, dens, T); %transformadaformada z del filtro
filtrado=filter(numz,denz,mensaje); %filtrar el audio

%%TRANSFORMADA Z DEL FILTRO%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
HZ=tf(numz,denz,T); %funcion de transferencia en el dominio Z del filtro
[P,Z]=pzmap(HZ); %encontrar los polos y ceros de la funcion de transferencia


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%ESPECTRO DE LA SEÑAL FILTRADA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
transformada_filt=abs(fft(filtrado)); %transformadaformada de Fourier del audio filtrado
espectro_filt=transformada_filt(1:L/2); %tomar sólo la mitad del espectro
espectro_filt=espectro_filt/maximo; %normalizar el espectro filtrado respecto al original
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%GRÁFICAS DE RESULTADOS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n=length(mensaje); %longitud del vector de audio
t=n/Fs; %tiempo total que dura el audio
Ts=1/Fs; %periodo de muestreo
tiempo=[0:Ts:(t-Ts)]; %vector de tiempo

figure %invocar una ventana de figura nueva
grafica1=subplot(2,1,1) %subfigura de dos filas y una columna, grafica 1
plot(tiempo,mensaje,'b') %graficar el mensaje original en azul (b)
hold on %mantener la gráfica en primer plano para graficar sobre ella
plot(tiempo,filtrado,'r') %graficar el mensaje filtrado en rojo (r)
title(['Señal de audio capturada, en el dominio del tiempo']); %titulo de la grafica
xlabel('Tiempo (s)') %etiqueta para el eje X
ylabel('Amplitud') %etiqueta para el eje Y
legend('Audio original','Audio filtrado') %etiquetas para las señales
sound(mensaje, Fs)
pause(3)

grafica2=subplot(2,1,2) %subfigura de dos filas y una columna, grafica 2
plot(frecuencias,espectro,'b') %graficar el espectro de la señal
hold on %mantener la gráfica en primer plano para graficar sobre ella
plot(frecuencias,espectro_filt,'r') %graficar el espectro de la señal filtrada
hold on
plot(frecuencias,funcion,'g')
title(['Espectro de la señal capturada']); %titulo de la grafica
xlabel('Frecuencia (Hz)') %etiqueta para el eje X
ylabel('Amplitud') %etiqueta para el eje Y
grid(grafica2,'on') %activar la cuadrícula en la gráfica 2
set(gca,'YTick',[0.1]) %graficar una linea de la cuadricula de y en 0.1
set(gca,'XTick',[fc]) %graficar una linea de la cuadricula de x en la frecuencia máxima de mi voz
ylim([0 max(espectro)]) %limitar el rango en "y" al valor máximo de la señal
xlim([0 2*fc]) %limitar el rango en "x" al valor que deseemos
legend('Espectro original','Espectro filtrado','Respuesta del filtro') %etiquetas para las señales
sound(filtrado,Fs) %reproducir el audio filtrado
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Grafica de transformada Z
figure  %invocar una ventana de figura nueva
zplane(Z,P) %graficar los polos y ceros del filtro
title(['Polos y ceros del sistema']); %titulo de la grafica
