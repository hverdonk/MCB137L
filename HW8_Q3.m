%HW8 - Q3

%Part A
%Please see paper hw

%Part B
Beta=0.25; %in 1/(pN*nm) 
deltaE_vector=-40:40;
temp=-Beta.*deltaE_vector;
temp2=1+exp(temp);
P_open=1./(temp2);

plot(deltaE_vector, P_open)
xlabel('Difference in energy between open and closed state (pN*nm)')
ylabel('Probability of the channel being open')

%Part C
%See paper hw

%Part D
%See paper hw for explanation
Vstar=-95; %in mV
voltages=[-135,-125,-115,-105,-95,-85,-75,-65,-55]; %in mV
pOpen=[0.0106,0.0371,0.0651,0.2431,0.4848,0.7791,0.8207,0.8087,0.9694];

plot(voltages, pOpen);
xlabel('Voltage applied to membrane (mV)')
ylabel('Probability of channel being open')

q=-1; %in electron charges
hold on
pOpen_theoretical=1./(1+exp(-Beta.*(q.*(Vstar-voltages))));
plot(voltages, pOpen_theoretical);
hold off

plot(voltages, pOpen);
xlabel('Voltage applied to membrane (mV)')
ylabel('Probability of channel being open')

q=-3; %in electron charges
hold on
pOpen_theoretical=1./(1+exp(-Beta.*(q.*(Vstar-voltages))));
plot(voltages, pOpen_theoretical);
hold off

plot(voltages, pOpen);
xlabel('Voltage applied to membrane (mV)')
ylabel('Probability of channel being open')

q=-5; %in electron charges
hold on
pOpen_theoretical=1./(1+exp(-Beta.*(q.*(Vstar-voltages))));
plot(voltages, pOpen_theoretical);
hold off
