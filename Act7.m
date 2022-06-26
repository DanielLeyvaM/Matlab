%Actividad 6
clc; clear all; close all hidden;
fprintf('Buenos días gente\n')%CR. Ehecatl
disp('Presione Enter para comenzar la grabación')
pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%GRABACIÓN DE AUDIO
Fs=44100; %se especifica la frecuencia de grabación
duracion=3;
bits=16;
canales=1;
grabacion1 = audiorecorder(Fs,bits,canales); %grabación a 16 bits y un sólo canal de audio
disp('Comienza a hablar.') %se despliega un mensaje para empezar a grabar
recordblocking(grabacion1, duracion); %grabar durante 3 segundos
disp('Fin de la grabacion 1.'); %desplegar un mensaje al terminar a grabar
audio1=getaudiodata(grabacion1); %cargar el audio grabado a un vector
audiowrite('C:\Users\Daniel Leyva\Documents\Daniel\CUCEI\6° Semestre\Procesamiento de Señales\Act5.wav',audio1,Fs); %guardar la información del vector en un archivo%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%LEER ARCHIVO DE AUDIO%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[mensaje,Fs] = audioread('Act5.wav');
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
funcion=abs(1./(i*(frecuencias/fc)+1));
nums=[1]; %numerador de la función de transformadaferencia del filtro
dens=[tau,1]; %denominador de la función de transformadaferencia del fitro
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

%Correlacion
autocorr=xcorr(transformada);
autocorrelaion=sum(autocorr)
n2=length(autocorr);%longitud del vector de audio
t2=n2/Fs; %tiempo total que dura el audio
Ts2=1/Fs; %periodo de muestreo
tiempo2=[0:Ts2:(t2-Ts2)]; %vector de tiempo

%GRÁFICAS DE RESULTADOS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n=length(mensaje); %longitud del vector de audio
t=n/Fs; %tiempo total que dura el audio
Ts=1/Fs; %periodo de muestreo
tiempo=[0:Ts:(t-Ts)]; %vector de tiempo
figure %invocar una ventana de figura nueva
grafica1=subplot(2,1,1); %subfigura de dos filas y una columna, grafica 1
plot(tiempo,filtrado,'b') %graficar el mensaje filtrado en azul (r)
title(['Señal de audio capturada, en el dominio del tiempo']); %titulo de la grafica
xlabel('Tiempo (s)') %etiqueta para el eje X
ylabel('Amplitud') %etiqueta para el eje Y
legend('Audio filtrado') %etiquetas para las señales
sound(mensaje, Fs)
pause(3)

grafica2=subplot(2,1,2); %subfigura de dos filas y una columna, grafica 2
plot(frecuencias,espectro_filt,'b') %graficar el espectro de la señal filtrada
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
legend('Espectro filtrado','Respuesta del filtro') %etiquetas para las señales
sound(filtrado,Fs) %reproducir el audio filtrado
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%% ALEX %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(autocorrelaion <= 50 && autocorrelaion >= 69)%%%%%modifica aqui de acuerdo a tu voz
fprintf("Integrante ALEX\n");
%     tarjeta=arduino('com3' , 'uno');
%     for i=0:5
%     writeDigitalPin(tarjeta,"d4",1)
%     pause(1)
%     writeDigitalPin(tarjeta, "d4",0)
%     pause(1)
%     end
else

%%%%%%%%%%%%%%%%%%%% ALAN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(autocorrelaion <= 1.30e12 && autocorrelaion >= 1.05e12)%%%%%modifica aqui de acuerdo a tu voz
fprintf("Integrante ALAN\n");
%     tarjeta=arduino('com3' , 'uno');
%     for i=0:5
%     writeDigitalPin(tarjeta,"d4",1)
%     pause(1)
%     writeDigitalPin(tarjeta, "d4",0)
%     pause(1)
%     end
else
    

%%%%%%%%%%%%%%%%%%%% KENNET %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(autocorrelaion <= 4.05e11 && autocorrelaion >= 2.15e11)%%%%%modifica aqui de acuerdo a tu voz
fprintf("Integrante KENNET\n");
%     tarjeta=arduino('com3' , 'uno');
%     for i=0:5
%     writeDigitalPin(tarjeta,"d4",1)
%     pause(1)
%     writeDigitalPin(tarjeta, "d4",0)
%     pause(1)
%     end
else
    
    

%%%%%%%%%%%%%%%%%%%% ROBERTO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(autocorrelaion <= 7.15e11 && autocorrelaion >= 4.10e11)%%%%%modifica aqui de acuerdo a tu voz
fprintf("Integrante ROBERTO\n");
%     tarjeta=arduino('com3' , 'uno');
%     for i=0:5
%     writeDigitalPin(tarjeta,"d5",1)
%     pause(1)
%     writeDigitalPin(tarjeta, "d5",0)
%     pause(1)
%     end
else
    
%%%%%%%%%%%%%%%%%%%% LEYVA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
if(autocorrelaion <= 10.9e11 && autocorrelaion >= 7.16e11)%%%%%modifica aqui de acuerdo a tu voz
fprintf("Integrante LEYVA\n");
%     tarjeta=arduino('com3' , 'uno');
%     for i=0:5
%     writeDigitalPin(tarjeta,"d6",1)
%     pause(1)
%     writeDigitalPin(tarjeta, "d6",0)
%     pause(1)
%     end
else
fprintf("Palabra incorrecta se ha detectado una amenaza ");
pause(2)

end
end
end
end
end