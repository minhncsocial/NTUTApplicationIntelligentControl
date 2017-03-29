close all; clear all; clc; 

num1 = [312];
den1 = [0.0047 0.41 8 0];
sys_plant = tf(num1, den1);
P = 1.35; 
I = 14.2; 
D = 0.03;
num2 = [D P I];
den2 = [1 0];
sys_controller = tf(num2, den2);
sysf = series(sys_plant, sys_controller);
sys = feedback(sysf, 1);
T = 0:0.001:1;
[y, T] = step(sys, T);
Err = 1.-y;
SAE = sum(abs(Err));
fitness = 100/SAE;
figure(1)
plot(T, y);
grid on;
