

num1 = [312];                   % The numerator of the plant
den1 = [0.0047 0.41 8 0];       % the denominator of the plant
sys_plant = tf(num1, den1);
kp = 1.34;
ki = 14.09;
kd = 0.032;
num2 = [kd kp ki];              % The numerator of the controller
den2 = [1 0];                   % the denominator of the controller
sys_controller = tf(num2, den2);
sysf = series(sys_plant, sys_controller);
sys = feedback(sysf, 1);        % Loop response
T = 0:0.001:1;                  % Sample freq. 1000Hz
[y, T] = step(sys,T);
Err = 1. - y;                   % The error
SAE = sum(abs(Err));  

figure(4);
plot(T, y);
grid on;