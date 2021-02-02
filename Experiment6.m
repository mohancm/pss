% Determination of Swing Curve

clc
clear all
tfc=input('enter fault clearing time=');
pi = 0.9;
e1=1.1;
e2=1.0;
m=0.016;
x0=0.45;
x1=1.25;
x2=0.55;
pm0=(e1*e2)/x0;
pm1=(e1*e2)/x1;
pm2=(e1*e2)/x2;
w=0;
d=asin(pi/pm0);
for t=0:0.05:1
    dg=d*180/3.1414;
    if(t<tfc)
    pm=pm1;
    else
    pm=pm2;
    end
    k1=w*.05;
    l1=(pi-pm*sin(d))*.05/m;
    k2=(w+.5*l1)*.05;
    l2=(pi-pm*sin(d+.5*k1))*.05/m;
    k3=(w+.5*l2)*.05;
    l3=(pi-pm*sin(d+.5*k2))*.05/m;
    k4=(w+l3)*.05;
    l4=(pi-pm*sin(d+k3))*.05/m;
    deld=(k1+2*k2+2*k3+k4)/6;
    delw=(l1+2*l2+2*l3+l4)/6;
    d=d+deld;
    w=w+delw;
    fprintf('%8.3f \t %8.3f \n', t, dg);
end