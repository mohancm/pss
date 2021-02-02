% Determine Power angle diagram of Salient Pole
% reluctance power, excitation emf and regulation

clc
clear all
% power angle Curve
p=input('power in MW = ');
pf=input('power factor = ');
vt=input('line voltage = ');
xd=input('xd in ohm = ');
xq=input('xq in ohm = ');
vt_ph=vt*1000/sqrt(3);
pf_a=acos(pf);
q=p*tan(pf_a);
i=(p-j*q)*1000000/(3*vt_ph);
delta=0:1:180;
delta_rad=delta*(pi/180);
%salient pole motor
eq=vt_ph+(j*i*xq);
del=angle(eq);
theta=del+pf_a;
id_mag=abs(i)*sin(theta);
ef_mag=vt_ph*cos(del)+id_mag*xd
reg=(ef_mag-abs(vt_ph))*100/abs(vt_ph)
pp=ef_mag*vt_ph*sin(delta_rad)/xd;
reluct_power=vt_ph^2*(xd-xq)*sin(2*delta_rad)/(2*xd*xq);
net_reluct_power=3*reluct_power/1000000;
power_sal=pp+reluct_power;
net_power_sal=3*power_sal/1000000;
plot(delta,net_reluct_power);
hold on
plot(delta,net_power_sal);
xlabel('\delta (deg)');
ylabel('3 phase power(MW)');
title('plot:power angle curve for salient pole syn mc');
legend('reluct power','salient power')
grid;