% Ybus formation by Inspection method:

clc
clear all
n =  input('enter no. of buses:'); % no of buses excluding reference
n1 = input('enter no. of lines:'); % no of transmission lines
sb = input('enter starting bus of each line:'); % starting bus of a line
eb = input('enter ending bus of each line:'); % ending bus of a line
zser = input('enter resistance and reactance of each line:'); % line resistance and reactance (R,X)
yshty = input('enter shunt admittance of the bus:'); %shunt admittance
i = 0
k = 1
while i < n1
    zser1(i+1) = zser(k) + j*zer(k+1)  % impedance of a line (R+jX)
    i = i+1
    k = k+2
    end
    zser2 = reshape(zser1, n1, 1);
    yser = ones(n1, 1)./zser2;
    ybus = zeros(n,n);
    for i=1:n1
        ybus(sb(i), sb(i)) = ybus(sb(i), sb(i)) + (j*yshty(i))+yser(i);
        ybus(eb(i), eb(i)) = ybus(eb(i), eb(i)) + (j*yshty(i))+yser(i);
        ybus(sb(i), eb(i)) = -yser(i);
        ybus(eb(i), sb(i)) = -yser(i);
