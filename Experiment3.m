% Determination of Bus Currents, bus Power and line flows for a specified Bus system profile

clc
clear all
vbus = [1.05+0j]; .98-0.0j; 1-0.05j]; % bus voltages
yline = [0 0 10 -20 10 -30 10 -20 0 0 16 -32 10 -30 16 -32 0 0]; % line G, B
n = 3
i = 0
k = 1;
while i < 9
    yline(i+1) = yline(k) + j*yline(k+1);
    i = i+1
    k = k+2
end
yline2 = reshape(yline1,3,3)
Sp = zeros(n,n)
for i = 1:n
    for k = 1:n
        if i==k 
            continue
        else
            I(i,k) = yline2(i,k)*(vbus(i)-vbus(k)); % line current
            I(k,i) = -I(i,k)
            S(i,k) = vbus(i)*conj(I(i,k)); % line power
            S(k,i) = vbus(k)*conj(I(k,i)); 
            S1(i,k) = S(i,k)+ S(k,i); % line losses
            Sp(i,i) = Sp(i,i) + S(i,k); % bus power
        end
    end
end
Sbus = [Sp(1,1); Sp(2,2); Sp(3,3)]
%bus current calculation:
Ibus = conj((Sbus/vbus))    % bus current