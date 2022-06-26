%Actividad 1 - operaciones b�sicas en se�ales de voz - procesamiento digital de se�ales
clc; clear all; close all hidden;
fprintf('Buenos d�as gente\n')%CR. Ehecatl
disp('Presione Enter para comenzar la grabaci�n')
pause

%%GRABACI�N DE AUDIO ALAN
Fs=44100; %se especifica la frecuencia de grabaci�n
duracion=3;
bits=16;
canales=1;
grabacion1 = audiorecorder(Fs,bits,canales); %grabaci�n a 16 bits y un s�lo canal de audio
disp('Comienza a hablar.') %se despliega un mensaje para empezar a grabar
recordblocking(grabacion1, duracion); %grabar durante 3 segundos
disp('Fin de la grabacion 1.'); %desplegar un mensaje al terminar a grabar
play(grabacion1); %reproducir la se�al grabada
alan=getaudiodata(grabacion1); %cargar el audio grabado a un vector
n1=length(alan);%longitud del vector de audio
t1=n1/Fs; %tiempo total que dura el audio
Ts1=1/Fs; %periodo de muestreo
tiempo1=[0:Ts1:(t1-Ts1)]; %vector de tiempo
audiowrite('C:\Users\Daniel Leyva\Documents\Daniel\CUCEI\6� Semestre\Procesamiento de Se�ales\Alan.wav',alan,Fs); %guardar la informaci�n del vector en un archivo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pause

clc
disp('Presione Enter para comenzar la grabaci�n')
pause

%%GRABACI�N DE AUDIO ALEX
Fs=44100; %se especifica la frecuencia de grabaci�n
duracion=3;
bits=16;
canales=1;
grabacion2 = audiorecorder(Fs,bits,canales); %grabaci�n a 16 bits y un s�lo canal de audio
disp('Comienza a hablar.') %se despliega un mensaje para empezar a grabar
recordblocking(grabacion2, duracion); %grabar durante 5 segundos
disp('Fin de la grabacion 2.'); %desplegar un mensaje al terminar a grabar
play(grabacion2); %reproducir la se�al grabada
alex=getaudiodata(grabacion2); %cargar el audio grabado a un vector
n2=length(alex);%longitud del vector de audio
t2=n2/Fs; %tiempo total que dura el audio
Ts2=1/Fs; %periodo de muestreo
tiempo2=[0:Ts2:(t2-Ts2)]; %vector de tiempo
audiowrite('C:\Users\Daniel Leyva\Documents\Daniel\CUCEI\6� Semestre\Procesamiento de Se�ales\Alex.wav',alex,Fs); %guardar la informaci�n del vector en un archivo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pause
clc
disp('Presione Enter para comenzar la grabaci�n')
pause

%%GRABACI�N DE AUDIO AZAHEL
Fs=44100; %se especifica la frecuencia de grabaci�n
duracion=3;
bits=16;
canales=1;
grabacion3 = audiorecorder(Fs,bits,canales); %grabaci�n a 16 bits y un s�lo canal de audio
disp('Comienza a hablar.') %se despliega un mensaje para empezar a grabar
recordblocking(grabacion3, duracion); %grabar durante 5 segundos
disp('Fin de la grabacion 3.'); %desplegar un mensaje al terminar a grabar
play(grabacion3); %reproducir la se�al grabada
azahel=getaudiodata(grabacion3); %cargar el audio grabado a un vector
n3=length(azahel);%longitud del vector de audio
t3=n3/Fs; %tiempo total que dura el audio
Ts3=1/Fs; %periodo de muestreo
tiempo3=[0:Ts3:(t3-Ts3)]; %vector de tiempo
audiowrite('C:\Users\Daniel Leyva\Documents\Daniel\CUCEI\6� Semestre\Procesamiento de Se�ales\Azahel.wav',azahel,Fs); %guardar la informaci�n del vector en un archivo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pause
clc
disp('Presione Enter para comenzar la grabaci�n')
pause

%%GRABACI�N DE AUDIO KENNETH
Fs=44100; %se especifica la frecuencia de grabaci�n
duracion=3;
bits=16;
canales=1;
grabacion4 = audiorecorder(Fs,bits,canales); %grabaci�n a 16 bits y un s�lo canal de audio
disp('Comienza a hablar.') %se despliega un mensaje para empezar a grabar
recordblocking(grabacion4, duracion); %grabar durante 5 segundos
disp('Fin de la grabacion 4.'); %desplegar un mensaje al terminar a grabar
play(grabacion4); %reproducir la se�al grabada
kenneth=getaudiodata(grabacion4); %cargar el audio grabado a un vector
n4=length(kenneth);%longitud del vector de audio
t4=n4/Fs; %tiempo total que dura el audio
Ts4=1/Fs; %periodo de muestreo
tiempo4=[0:Ts4:(t4-Ts4)]; %vector de tiempo
audiowrite('C:\Users\Daniel Leyva\Documents\Daniel\CUCEI\6� Semestre\Procesamiento de Se�ales\Kenneth.wav',kenneth,Fs); %guardar la informaci�n del vector en un archivo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pause
clc
disp('Presione Enter para comenzar la grabaci�n')
pause

%%GRABACI�N DE AUDIO DANI
Fs=44100; %se especifica la frecuencia de grabaci�n
duracion=3;
bits=16;
canales=1;
grabacion5 = audiorecorder(Fs,bits,canales); %grabaci�n a 16 bits y un s�lo canal de audio
disp('Comienza a hablar.') %se despliega un mensaje para empezar a grabar
recordblocking(grabacion5, duracion); %grabar durante 5 segundos
disp('Fin de la grabacion 5.'); %desplegar un mensaje al terminar a grabar
play(grabacion5); %reproducir la se�al grabada
dani=getaudiodata(grabacion5); %cargar el audio grabado a un vector
n5=length(dani);%longitud del vector de audio
t5=n5/Fs; %tiempo total que dura el audio
Ts5=1/Fs; %periodo de muestreo
tiempo5=[0:Ts5:(t5-Ts5)]; %vector de tiempo
audiowrite('C:\Users\Daniel Leyva\Documents\Daniel\CUCEI\6� Semestre\Procesamiento de Se�ales\Dani.wav',dani,Fs); %guardar la informaci�n del vector en un archivo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t=([n1:n5])/Fs; %tiempo total que dura el audio
Ts=1/Fs; %periodo de muestreo
tiempo=[0:Ts:(t-Ts)]; %vector de tiempo


pause;
f=1;
while f==1
clc
prompt=('�Qu� desea hacer con las se�ales?\n \n 1. Escalamiento en amplitud\n 2. Suma\n 3. Submuestreo\n 4. Modulaci�n\n ');
x=input(prompt);

switch x
    case 1; %Escalamiento
        factor=input('Ingrese el factor al que desea escalar las se�ales \n')   %Se pide ingresar el factor
            m1=alan*factor; %Se multiplica el factor por la se�al
            m2=alex*factor; %Se multiplica el factor por la se�al
            m3=azahel*factor;   %Se multiplica el factor por la se�al
            m4=kenneth*factor;  %Se multiplica el factor por la se�al
            m5=dani*factor; %Se multiplica el factor por la se�al
            %%%%%----------------------------------------------------
            subplot(5,2,1)
            plot(tiempo1,alan,'b')
            title('Se�al de audio capurada alan');
            xlabel('Tiempo (s)')
            ylabel('Amplitud')
            play(grabacion1)
            pause(3)
            
            subplot(5,2,2)
            plot(tiempo1,m1,'b')
            title('Se�al de audio escalada alan');
            xlabel('Tiempo (s)')
            ylabel('Amplitud')
            p1=audioplayer(m1,Fs);  %se convierte el vector a un archivo de audio
            play(p1)
            
            %%%------------------------------------------------------
            %%%------------------------------------------------------
            pause(3)
            subplot(5,2,3)
            plot(tiempo2,alex,'m')
            title('Se�al de audio capturada alex');
            xlabel('Tiempo (s)')
            ylabel('Amplitud')
            play(grabacion2)
            pause(3)
            
            subplot(5,2,4)
            plot(tiempo2,m2,'m')
            title('Se�al de audio escalada alex');
            xlabel('Tiempo (s)')
            ylabel('Amplitud')
            p2=audioplayer(m2,Fs);  %se convierte el vector a un archivo de audio
            play(p2)
                        
            %%%------------------------------------------------------
            %%%------------------------------------------------------
            pause(3)
            subplot(5,2,5)
            plot(tiempo3,azahel,'r')
            title('Se�al de audio capturada azahel');
            xlabel('Tiempo (s)')
            ylabel('Amplitud')
            play(grabacion3)
            pause(3)
            
            subplot(5,2,6)
            plot(tiempo3,m3,'r')
            title('Se�al de audio escalada azahel');
            xlabel('Tiempo (s)')
            ylabel('Amplitud')
            p3=audioplayer(m3,Fs);  %se convierte el vector a un archivo de audio
            play(p3)
           
            %%%------------------------------------------------------
            %%%------------------------------------------------------
            pause(3)
            subplot(5,2,7)
            plot(tiempo4,kenneth,'g')
            title('Se�al de audio capturada kenneth');
            xlabel('Tiempo (s)')
            ylabel('Amplitud')
            play(grabacion4)
            pause(3)
            
            subplot(5,2,8)
            plot(tiempo4,m4,'g')
            title('Se�al de audio escalada kenneth');
            xlabel('Tiempo (s)')
            ylabel('Amplitud')
            p4=audioplayer(m4,Fs);  %se convierte el vector a un archivo de audio
            play(p4)
            
            %%%------------------------------------------------------
            %%%------------------------------------------------------
            pause(3)
            subplot(5,2,9)
            plot(tiempo5,dani,'k')
            title('Se�al de audio capturada dani');
            xlabel('Tiempo (s)')
            ylabel('Amplitud')
            play(grabacion5)
            pause(3)
            
            subplot(5,2,10)
            plot(tiempo5,m5,'k')
            title('Se�al de audio escalada dani');
            xlabel('Tiempo (s)')
            ylabel('Amplitud')
            p5=audioplayer(m5,Fs);  %se convierte el vector a un archivo de audio
            play(p5)
            
            %%%------------------------------------------------------
    case 2; %Suma
        
        teamperfect=alan+alex+azahel+kenneth+dani; %Se suman los audios
        nsuma=length(teamperfect);%longitud del vector de audio
        tsuma=nsuma/Fs; %tiempo total que dura el audio
        Tssuma=1/Fs; %periodo de muestreo
        tiemposuma=[0:Tssuma:(tsuma-Tssuma)]; %vector de tiempo
        %%%%%----------------------------------------------------
            subplot(6,1,1)
            plot(tiempo1,alan,'b')
            title('Se�al de audio capturada alan');
            xlabel('Tiempo (s)')
            ylabel('Amplitud')
            play(grabacion1)
                        
            %%%------------------------------------------------------
            pause(3)
            subplot(6,1,2)
            plot(tiempo2,alex,'m')
            title('Se�al de audio capturada alex');
            xlabel('Tiempo (s)')
            ylabel('Amplitud')
            play(grabacion2)                     
           
            %%%------------------------------------------------------
            %%%------------------------------------------------------
            pause(3)
            subplot(6,1,3)
            plot(tiempo3,azahel,'r')
            title('Se�al de audio capturada azahel');
            xlabel('Tiempo (s)')
            ylabel('Amplitud')
            play(grabacion3)
            
            %%%------------------------------------------------------
            %%%------------------------------------------------------
            pause(3)
            subplot(6,1,4)
            plot(tiempo4,kenneth,'g')
            title('Se�al de audio capturada kenneth');
            xlabel('Tiempo (s)')
            ylabel('Amplitud')
            play(grabacion4)
            
            %%%------------------------------------------------------
            %%%------------------------------------------------------
            pause(3)
            subplot(6,1,5)
            plot(tiempo5,dani,'k')
            title('Se�al de audio capturada dani');
            xlabel('Tiempo (s)')
            ylabel('Amplitud')
            play(grabacion5)                        
            
            %%%------------------------------------------------------
            pause(3)
            subplot(6,1,6)
            plot(tiemposuma,teamperfect,'c')
            title('Se�al de audio sumada');
            xlabel('Tiempo (s)')
            ylabel('Amplitud')             
            peq=audioplayer(teamperfect,Fs); %se convierte el vector a un archivo de audio
            play(peq)
        
    case 3; %Submuestreo
        subm=input('Introduzca el factor de submuestreo: '); %se solicita el factor de submuestreo
        %------------------------------------------------------------------
        mensaje_submuestreado1=downsample(alan,subm);   %downsample (audio,frecuencia de muestreo) 
        n01=length(mensaje_submuestreado1); %longitud del vector de audio submuestreado
        t1=n01/Fs;  %tiempo total que dura el audio
        x1= Fs/subm;    %Dividimos la frecuencia de muestreo por el factor
        Ts1=1/x1;   %periodo de muestreo
        tiempo1=[0:Ts1:(t-Ts1)];    %vector de tiempo submuestreado
        %------------------------------------------------------------------
        mensaje_submuestreado2 = downsample(alex,subm); %downsample (audio,frecuencia de muestreo)
        n02=length(mensaje_submuestreado2); %longitud del vector de audio submuestreado
        t2=n02/Fs;  %tiempo total que dura el audio
        x2= Fs/subm;    %Dividimos la frecuencia de muestreo por el factor
        Ts2=1/x2;   %periodo de muestreo
        tiempo2=[0:Ts2:(t-Ts2)];    %vector de tiempo submuestreado
        %------------------------------------------------------------------
        mensaje_submuestreado3 = downsample(azahel,subm);   %downsample (audio,frecuencia de muestreo)
        n03=length(mensaje_submuestreado3); %longitud del vector de audio submuestreado
        t3=n03/Fs;  %tiempo total que dura el audio
        x3= Fs/subm;    %Dividimos la frecuencia de muestreo por el factor
        Ts3=1/x3;   %periodo de muestreo
        tiempo3=[0:Ts3:(t-Ts3)];    %vector de tiempo submuestreado
        %------------------------------------------------------------------
        mensaje_submuestreado4 = downsample(kenneth,subm);  %downsample (audio,frecuencia de muestreo)
        n04=length(mensaje_submuestreado4); %longitud del vector de audio submuestreado
        t4=n04/Fs;  %tiempo total que dura el audio
        x4= Fs/subm;    %Dividimos la frecuencia de muestreo por el factor
        Ts4=1/x4;   %periodo de muestreo
        tiempo4=[0:Ts4:(t-Ts4)];    %vector de tiempo submuestreado
        %------------------------------------------------------------------
        mensaje_submuestreado5 = downsample(dani,subm); %downsample (audio,frecuencia de muestreo)
        n05=length(mensaje_submuestreado5); %longitud del vector de audio submuestreado
        t5=n05/Fs;  %tiempo total que dura el audio
        x5= Fs/subm;    %Dividimos la frecuencia de muestreo por el factor
        Ts5=1/x5;   %periodo de muestreo
        tiempo5=[0:Ts5:(t-Ts5)];    %vector de tiempo submuestreado
        %------------------------------------------------------------------
        
        subplot(5,2,1)
        plot(tiempo,alan,'b')
        title('se�al de voz (alan)')
        xlabel('Tiempo (s)')
        ylabel('Amplitud (V)')
        play(grabacion1)
        pause(3)
        
        subplot(5,2,2)
        plot(tiempo1,mensaje_submuestreado1,'b')
        title('se�al de voz muestreada (alan)')
        xlabel('Tiempo (s)')
        ylabel('Amplitud (V)')
        p01=audioplayer(mensaje_submuestreado1,x1)  %se convierte el vector a un archivo de audio
        play(p01)
        pause(3)
        
        subplot(5,2,3)
        plot(tiempo,alex,'y')
        title('se�al de voz (alex)')
        xlabel('Tiempo (s)')
        ylabel('Amplitud (V)')
        play(grabacion2)
        pause(3)
        
        subplot(5,2,4)
        plot(tiempo2,mensaje_submuestreado2,'y')
        title('se�al de voz muestreada (alex)')
        xlabel('Tiempo (s)')
        ylabel('Amplitud (V)')
        p02=audioplayer(mensaje_submuestreado2,x2) %se convierte el vector a un archivo de audio
        play(p02)
        pause(3)
        
        subplot(5,2,5)
        plot(tiempo,azahel,'g')
        title('se�al de voz (azahel)')
        xlabel('Tiempo (s)')
        ylabel('Amplitud (V)')
        play(grabacion3)
        pause(3)
        
        subplot(5,2,6)
        plot(tiempo3,mensaje_submuestreado3,'g')
        title('se�al de voz muestreada (azahel)')
        xlabel('Tiempo (s)')
        ylabel('Amplitud (V)')
        p03=audioplayer(mensaje_submuestreado3,x3)  %se convierte el vector a un archivo de audio
        play(p03)
        pause(3)
        
        subplot(5,2,7)
        plot(tiempo,kenneth,'k')
        title('se�al de voz (kenneth)')
        xlabel('Tiempo (s)')
        ylabel('Amplitud (V)')
        play(grabacion4)
        pause(3)
        
        subplot(5,2,8)
        plot(tiempo4,mensaje_submuestreado4,'k')
        title('se�al de voz muestreada (kenneth)')
        xlabel('Tiempo (s)')
        ylabel('Amplitud (V)')
        p04=audioplayer(mensaje_submuestreado4,x4)  %se convierte el vector a un archivo de audio
        play(p04)
        pause(3)
        
        subplot(5,2,9)
        plot(tiempo,dani,'r')
        title('se�al de voz (dani)')
        xlabel('Tiempo (s)')
        ylabel('Amplitud (V)')
        play(grabacion5)
        pause(3)
        
        subplot(5,2,10)
        plot(tiempo5,mensaje_submuestreado5,'r')
        title('se�al de voz muestreada (dani)')
        xlabel('Tiempo (s)')
        ylabel('Amplitud (V)')
        p05=audioplayer(mensaje_submuestreado5,x5)  %se convierte el vector a un archivo de audio
        play(p05)
        
        %------------------------------------------------------------------
    case 4; %Modulaci�n
        mul=alan.*alex.*azahel.*kenneth.*dani;  %se multiplican los audios de voz
        eq=audioplayer(mul,Fs); %se convierte el vector a un archivo de audio
        
        subplot(6,1,1)
        plot(tiempo,alan,'b')
        title('se�al de voz (alan)')
        xlabel('Tiempo (s)')
        ylabel('Amplitud (V)')
        play(grabacion1)
        pause(3)
        
        subplot(6,1,2)
        plot(tiempo,alex,'y')
        title('se�al de voz (alex)')
        xlabel('Tiempo (s)')
        ylabel('Amplitud (V)')
        play(grabacion2)
        pause(3)
        
        subplot(6,1,3)
        plot(tiempo,azahel,'g')
        title('se�al de voz (azahel)')
        xlabel('Tiempo (s)')
        ylabel('Amplitud (V)')
        play(grabacion3)
        pause(3)
        
        subplot(6,1,4)
        plot(tiempo,kenneth,'k')
        title('se�al de voz (kenneth)')
        xlabel('Tiempo (s)')
        ylabel('Amplitud (V)')
        play(grabacion4)
        pause(3)
        
        subplot(6,1,5)
        plot(tiempo,dani,'r')
        title('se�al de voz (dani)')
        xlabel('Tiempo (s)')
        ylabel('Amplitud (V)')
        play(grabacion5)
        pause(3)
        
        subplot(6,1,6)
        title('se�al resultante del producto de voces')
        xlabel('Tiempo (s)')
        ylabel('Amplitud (V)')
        plot(tiempo,mul,'m')
        play(eq)
    otherwise;
        disp('No m�s existen 4 opciones y usted no escogi� ninguna, en conclusi�n... no le sabe :)')
end
clc
fprintf('�Quiere realizar otra operaci�n?\n\n')
f=input(' 1. S� \n Cualquier otro n�mero. No\n\n ')
clc
end
fprintf('No le sabes ;), date de baja')
