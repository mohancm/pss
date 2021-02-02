% Ybus formation by singular tranformation method with Mutual coupling

clc
clear all
n=input(‘enter no. of buses:’); % no. of buses excluding reference
nl= input(‘enter no. of lines:’); % no. of transmission lines
sb= input(‘enter starting bus of each line:’); % starting bus of a line
eb= input(‘enter ending bus of each line’); % ending bus of a line
zser= input(‘enter resistance and reactance of each line:’); % line resistance and reactance (R, X)
nmc= input(‘enter no. of mutual couplings:’);
f1= input(‘enter first line no. of each mutual coupling:’);
s1= input(‘enter second line no. of each mutual coupling:’);
mz= input(‘enter mutual impedance between lines:’);
i=0
k=1
while i<nl
    zser1(i+1)=zser(k)+j*zser(k+1) % impedance of a line (R+jX)
    i=i+1
    k=k+2
end
i=0
k=1
while i<nmc
    mz1(i+1)=mz(k)+j*mz(k+1)
    i=i+1
    k=k+2
end
zser2=reshape(zser1,nl,1);
mz2=reshape(mz1,2,1);
zpri=zeros(nl,nl);
a=zeros(nl,n)

for i=1:nl
    zpri(i,i)=zser2(i);
    if sb(i)~=0
        a(i,sb(i))=1;
    end
    if eb(i)~=0
    a(i,eb(i))=-1
    end
end
for i=1:nmc
    zpri(f1(i),s1(i))=mz2(i);
    zpri(s1(i),f1(i))=mz2(i);
end
ypri=inv(zpri)
at=transpose(a)
ybus=at*ypri*a
zbus=inv(ybus)