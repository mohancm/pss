% Ybus formation by singular transformation method without Mutual coupling

clc
clear all
n=input(‘enter no. of buses:’); % no. of buses excluding reference
nl= input(‘enter no. of lines:’); % no. of transmission lines
sb= input(‘enter starting bus of each line:’); % starting bus of a line
eb= input(‘enter ending bus of each line’); % ending bus of a line
zser= input(‘enter resistance and reactance of each line:’); % line resistance and reactance (R, X)
yshty= input(‘enter shunt admittance of the bus:’); % shunt admittance
i=0;
k=1;
while i<nl
    zser1(i+1)=zser(k)+j*zser(k+1); % impedance of a line (R+jX)
    i=i+1;
    k=k+2;
end
zser2=reshape(zser1,nl,1);
yser=ones(nl,1)./zser2;
ypri=zeros(nl+n,nl+n);
ybus=zeros(n,n);
a=zeros(nl+n,n);
for i=1:n
    a(i,i)=1;
end
for i=1:nl
    a(n+i,sb(i))=1;
    a(n+i,eb(i))=-1;
    ypri(n+i,n+i)=yser(i);
    ypri(sb(i),sb(i))=ypri(sb(i),sb(i))+yshty(i);
    ypri(eb(i),eb(i))=ypri(sb(i),eb(i))+yshty(i);
end
at=transpose(a);
ybus=at*ypri*a;
zbus=inv(ybus);