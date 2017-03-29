clear
t = 0:0.01:10;
xd = 0.15*cos(2*pi/1.5*t) + 0.25;
yd = 0.15*sin(2*pi/1.5*t) + 0.25;
for i = 1:1001
    m = xd(i)^2 + yd(i)^2;
    th1(i) = atan2(yd(i), xd(i)) - acos((m + 0.16 - 0.0576)/0.8/sqrt(m));
    th2(i) = th1(i) + acos((m - 0.16 - 0.0576)/0.192);
end
x = 0.4*cos(th1) + 0.24*cos(th2);
y = 0.4*sin(th1) + 0.24*sin(th2);
th1 = [t; th1];
th2 = [t; th2];
save th1 th1
save th2 th2