clear all
clc
syms n z

funcion=(z^2-2*z+2)/(z^2-7*z/12+1/12)
INVERSA=iztrans(funcion)
pretty(INVERSA)
