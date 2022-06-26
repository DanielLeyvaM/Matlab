%actividad 
clc; clear all; close all hidden;
fprintf('Buenos días gente\n adivinare quien hablo \n')%CR. Ehecatl
disp('Color Azul: Alejandro')
disp('Color Verde: Kennet')
disp('Color amarillo: Leyva')
disp('Color Rojo: Roberto')
disp('Color Blanco: Alexis')
disp('Presione Enter para comenzar la grabación')
pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%GRABACIÓN DE AUDIO 
Fs=44100; %se especifica la frecuencia de grabación
duracion=2;
bits=16;
canales=1;
grabacion1 = audiorecorder(Fs,bits,canales); %grabación a 16 bits y un sólo canal de audio
disp('Comienza a hablar.') %se despliega un mensaje para empezar a grabar
recordblocking(grabacion1, duracion); %grabar durante 3 segundos
disp('Fin de la grabacion 1.'); %desplegar un mensaje al terminar a grabar
audio1=getaudiodata(grabacion1); %cargar el audio grabado a un vector
audiowrite('C:\Users\Alejandro\Desktop\6 semestre\Procesamiento de señales\Act7.wav',audio1,Fs); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%LEER ARCHIVO DE AUDIO%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[mensaje,Fs] = audioread('Act7.wav');
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
fc=1500; %frecuencia de corte
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
autocorr=xcorr(audio1);
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
plot(tiempo,mensaje,'b') %graficar el mensaje original en azul (b)
hold on
title(['Señal de audio capturada, en el dominio del tiempo']); %titulo de la grafica
xlabel('Tiempo (s)') %etiqueta para el eje X
ylabel('Amplitud') %etiqueta para el eje Y
legend('Audio original') %etiquetas para las señales
sound(mensaje, Fs)
pause(3)

grafica2=subplot(2,1,2); %subfigura de dos filas y una columna, grafica 2
plot(frecuencias,espectro,'b') %graficar el espectro de la señal
hold on %mantener la gráfica en primer plano para graficar sobre ella

plot(frecuencias,funcion,'g')
title(['Espectro de la señal capturada']); %titulo de la grafica
xlabel('Frecuencia (Hz)') %etiqueta para el eje X
ylabel('Amplitud') %etiqueta para el eje Y
grid(grafica2,'on') %activar la cuadrícula en la gráfica 2
set(gca,'YTick',[0.1]) %graficar una linea de la cuadricula de y en 0.1
set(gca,'XTick',[fc]) %graficar una linea de la cuadricula de x en la frecuencia máxima de mi voz
ylim([0 max(espectro)]) %limitar el rango en "y" al valor máximo de la señal
xlim([0 2*fc]) %limitar el rango en "x" al valor que deseemos
legend('Espectro original','Respuesta del filtro') %etiquetas para las señales
sound(filtrado,Fs) %reproducir el audio filtrado
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ALCANZADO
if(autocorrelaion <= 3000 && autocorrelaion >= 250)%%%%%modifica aqui de acuerdo a tu voz
    fprintf("Hablo Alejandro, Led azul encendido!!! ");
    tarjeta=arduino('com3' , 'uno');
    for i=0:5
        writeDigitalPin(tarjeta,"d4",1)
        pause(1)
        writeDigitalPin(tarjeta, "d4",0)
        pause(1)
    end
else
    if(autocorrelaion <=   0.0070 && autocorrelaion >=    3.7626e-05)%%%%%modifica aqui de acuerdo a tu voz
    fprintf("Hablo Kenneth, Led verde encendido!!! ");

    tarjeta=arduino('com3' , 'uno');
    for i=0:5
        writeDigitalPin(tarjeta,"d5",1)
        pause(1)
        writeDigitalPin(tarjeta, "d5",0)
        pause(1)
    end
    else
    if(autocorrelaion <= 150 && autocorrelaion >=  75)%%%%%modifica aqui de acuerdo a tu voz
    fprintf("Hablo Leyva, Led amarillo encendido!!! ");
    tarjeta=arduino('com3' , 'uno');
    for i=0:5
        writeDigitalPin(tarjeta,"d6",1)
        pause(1)
        writeDigitalPin(tarjeta, "d6",0)
        pause(1)
    end
    else
    if(autocorrelaion <= 1 && autocorrelaion >=   0.0022)%%%%%modifica aqui de acuerdo a tu voz
    fprintf("Hablo Roberto , Led Rojo encendido!!! ");
    tarjeta=arduino('com3' , 'uno');
    for i=0:5
        writeDigitalPin(tarjeta,"d7",1)
        pause(1)
        writeDigitalPin(tarjeta, "d7",0)
        pause(1)
    end
      else
    if(autocorrelaion <= 35 && autocorrelaion >= 1.1)%%%%%modifica aqui de acuerdo a tu voz
    fprintf("Hablo Alexis, Led blanco encendido!!! ");
    tarjeta=arduino('com3' , 'uno');
    for i=0:5
        writeDigitalPin(tarjeta,"d8",1)
        pause(1)
        writeDigitalPin(tarjeta, "d8",0)
        pause(1)
    end
    else
 fprintf("Palabra incorrecta se ha detectado una amenaza "); 
    end
    end
    end
    end
end


