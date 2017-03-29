function Error = calculateErrorResponse(P, I, D)
    num1 = [5];
    den1 = [0.01 1];
    sys1 = tf(num1, den1);
    num2 = [1];
    den2 = [1 20];
    sys2 = tf(num2, den2);

    sys3 = sys1*sys2;
    sys4 = sys3/(1 + 7*sys3);
    num5 = [1];
    den5 = [1 0];
    sys5 = tf(num5, den5);
    sys6 = sys4*sys5;

    % P = 792.12; I = 18638; D = 8.42;
    num6 = [D P I];
    den6 = [1 0];
    sys_controller = tf(num6, den6);

    sysf = sys_controller*sys6;
    sys = sysf/(1 + sysf);

%     num1 = [312];
%     den1 = [0.0047 0.41 8 0];
%     sys_plant = tf(num1, den1);
%     num2 = [D P I];
%     den2 = [1 0];
%     sys_controller = tf(num2, den2);
%     sysf = series(sys_plant, sys_controller);
%     sys = feedback(sysf, 1);

    T = 0:0.001:1;
    [y, T] = step(sys, T);
    figure(123456);
    plot(T, y);
    grid on;

    Error = 1.-y;
return
