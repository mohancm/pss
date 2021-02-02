% Determination of power angle of Non-Salient
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
% non salient syn motor
ef=vt_ph+(j*i*xd);
excitation_emf=abs(ef)
reg=(abs(ef)-abs(vt_ph))*100/abs(vt_ph)
power_non=abs (ef)*vt_ph*sin(delta_rad)/xd;
net_power=3*power_non/1000000;
plot(delta,net_power);
xlabel('\delta (deg)');
ylabel('3 phase power(MW)');
title('plot:power angle curve for non salient pole syn mc');
legend('non salient power')
grid;