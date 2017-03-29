% close all; clear all; clc; 

num1 = [5];
den1 = [0.01 1];
sys1 = tf(num1, den1);
num2 = [1];
den2 = [1 20];
sys2 = tf(num2, den2);

sysf3 = series(sys2, sys1);
sys3 = feedback(sysf3, 7);

num4 = [1];
den4 = [1 0];
sys4 = tf(num4, den4);

sys4 = sys3*sys4;

P = 792.12; I = 18638; D = 8.42;
% P = 1320; I = 0; D = 0;
% P = 1.35; I = 14.2; D = 0.03;
num5 = [D P I];
den5 = [1 0];
sys_controller = tf(num5, den5);

sysf = series(sys4, sys_controller);
sys = feedback(sysf, 1)

T = 0:0.001:1;
[y, T] = step(sys, T);
figure(1);
plot(T, y);
grid on;

Err = 1.-y;
SAE = sum(abs(Err));
fitness = 100/SAE;
hold on;
plot(T, Err);

figure(2);
sim('motor1');
plot(response1.time, response1.signals.values, 'b');
grid on;
hold on;
plot(Error1.time, Error1.signals.values, 'r');