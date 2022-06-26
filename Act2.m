%Actividad 2 - - Correlación procesamiento digital de señales
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
n1=length(audio1);%longitud del vector de audio
t1=n1/Fs; %tiempo total que dura el audio
Ts1=1/Fs; %periodo de muestreo
tiempo1=[0:Ts1:(t1-Ts1)]; %vector de tiempo
audiowrite('C:\Users\Daniel Leyva\Documents\Daniel\CUCEI\6° Semestre\Procesamiento de Señales\Audio2.wav',audio1,Fs); %guardar la información del vector en un archivo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Correlacion
autocorr=xcorr(audio1);
autocorrelaion=sum(autocorr)
n2=length(autocorr);%longitud del vector de audio
t2=n2/Fs; %tiempo total que dura el audio
Ts2=1/Fs; %periodo de muestreo
tiempo2=[0:Ts2:(t2-Ts2)]; %vector de tiempo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Grafica del audio
subplot(2,1,1)
plot(tiempo1,audio1,'b')
title('Señal de audio capurada');
xlabel('Tiempo (s)')
ylabel('Amplitud')

%Grafica del audio
subplot(2,1,2)
plot(tiempo2,autocorr,'r')
title('Señal de autocorrelacion');
xlabel('Tiempo (s)')
ylabel('Amplitud')
play(grabacion1)
pause(3)