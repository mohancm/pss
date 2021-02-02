% Calculation of Efficiency and regulation if sending end Parameters are given:
clc
clear all
len = input('enter the lenght of the line in KM:');
r1 = input('enter the resistance/phase/Km of the line:');
x1 = input('enter the reactance/phase/Km of the line:');
s = input('enter the suspectance/phase/Km of the line:');
vs = input('enter the sending end voltage/phase of the line:');
is = input('enter the sending end current of the line:');
z  = r1 + j*x1;
y = j*s;
Z = z*len;
Y = y*len;
if len <=80
    x=1;
elseif len<=240
    x=2;
else
    x=3;
end
switch x 
case 1
    A=1;
    B=Z;
    C=0;
    D=A;
case 2
    p = input('enter 1 for PI and 2 for T');
    A = 1+(Y*Z)/2;
    D=A;
if p==1
B=Z;
C=Y*(1+(Z*Y)/4);
else
C=Y;
B=Z*(1+(Z*Y)/4);
end
case 3
    A=cosh(sqrt(Y*Z));
    B=sqrt(Z/Y)*sinh(sqrt(Y*Z));
    C=sqrt(Y/Z)*sinh(sqrt(Y*Z));
    D=A;
end
ABCD=A*D-B*C;
vr=D*vs-B*is;
ir=-C*vs+A*is;
spower=3*vs*conj(is)
rpower=3*vr*conj(ir)
efficiency= real(rpower)/real(spower)*100;
regulation=(abs(vs)/abs(A)-abs(vr))/abs(vr)*100;