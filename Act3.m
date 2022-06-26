%Actividad 3 - - FOURIER procesamiento digital de señales
clc; clear all; close all hidden;
fprintf('Buenos días gente\n')%CR. Ehecatl
n=input('Ingrese el tamaño del vector: ');
x=zeros(1,n);
vfourier=zeros(1,n);

for i=1:n
    v(i)=input('Ingresa el valor del vector:  ');
end

%Transformada de Fourier
for k=1:n
    for j=1:n
        vfourier(k)=vfourier(k)+((v(j))*exp((2*pi*1i*(k-1)*(j-1))/n));
    end
    vfourier(k)=abs(vfourier(k));
end

vfourier

%Graficar Vector
figure
subplot(2,1,1)
stem(v,'r')
title('Vector Original')
ylabel('Amplitud')

%Graficar vector transformado
subplot(2,1,2)
stem(vfourier,'b')
title('Transformada de Fourier de Vector')
ylabel('Amplitud')

