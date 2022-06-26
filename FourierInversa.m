clear all
clc
syms w t

F=2/(w^2+1)
INVERSAFOURIER=ifourier(F,t)
pretty(INVERSAFOURIER)