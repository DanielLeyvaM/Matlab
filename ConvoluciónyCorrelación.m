%Convolución
h=[1,2,1,-1];
x=[1,2,3,1];
y=conv(x,h)
%Para 3 vectores
%y=conv(conv(x,h),m)

%Correlacion
x=[1,2,3,1];
y=[1,2,1];
xcorr(x,y)

%Autocorrelacion
xcorr(x)