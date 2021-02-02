% Jacobian Matrix

clc
clear all
n = 4
v = [1 1 1 1]
ybus = [70-90j -20+40j -50+50j 0+0j; -20+40j 43.08-55.39j 0+0j -23.077+15.39j];
    -50+50j 0+0j 75-75j -25+25j;0+0j -23.077+15.39j -25+25j 48.077-40.39j]
for i=1:n
    for j=1:n
        y(i,j)=abs(ybus(i,j))
        yn(i,j)=angle(ybus(i,j))
        v(i)=abs(v(i))
        vn(i)=angle(v(i))
    end
end
J1=zeros(n,n)
J2=zeros(n,n)
J3=zeros(n,n)
J4=zeros(n,n)
i=2
while i <= n
    J2(i,i)=J2(i,i)+2*v(i)*y(i,i)*cos(yn(i,i))
    J4(i,i)=J4(i,i)-2*v(i)*y(i,i)*sin(yn(i,i))
for j=1:n
    if i==j
        continue;
    else
    J1(i,i)=J1(i,i)+v(i)*v(j)*y(i,j)*sin(yn(i,j)-vn(i)+vn(j))
    J1(i,j)=-1*v(i)*v(j)*y(i,j)*sin(yn(i,j)-vn(i)+vn(j))
    J2(i,i)=J2(i,i)+v(j)*y(i,j)*cos(yn(i,j)-vn(i)+vn(j))
    J2(i,j)=v(i)*y(i,j)*cos(yn(i,j)-vn(i)+vn(j))
    J3(i,i)=J3(i,i)+v(i)*v(j)*y(i,j)*cos(yn(i,j)-vn(i)+vn(j))
    J3(i,j)=-1*v(i)*v(j)*y(i,j)*cos(yn(i,j)-vn(i)+vn(j))
    J4(i,i)=J4(i,i)-v(j)*y(i,j)*sin(yn(i,j)-vn(i)+vn(j))
    J4(i,j)=-1*v(i)*y(i,j)*sin(yn(i,j)-vn(i)+vn(j))
    end
end
    i=i+1
end
J11=J1(2:n,2:n)
J22=J2(2:n,2:n)
J33=J3(2:n,2:n)
J44=J4(2:n,2:n)
Jacobian=[J11 J22;J33 J44]