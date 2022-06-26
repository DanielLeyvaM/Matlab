clear
clc
syms x y

f=-2*x*y
x=[0 1 2 3 4 5]
y=[9 8 7 6 5 4]

for i=1:1
    
resultado=subs(f,x(i))
end