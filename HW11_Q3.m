%HW11 Q3

%Part A

% Studying the plots, we can see that the larger r is, the steeper the
% initial slope of the graph is. Therefore, r must determine the initial
% slope.

%Model Parameters
N0=0;      %mRNA molecules at t=0
r1=10;      %mRNA/min
r2=20;      %mRNA/min
gamma=1;    %in 1/min
dt=0.1;     %in minutes
tmax=20;    %in minutes

%Create Matrices
Na=zeros(tmax/dt, 1);
Nb=zeros(tmax/dt, 1);

%Seed each matrix with the initial condition
Na(1)=N0;
Nb(1)=N0;

for i=2:tmax/dt
    Na(i)=Na(i-1)+(r1*dt)-(Na(i-1)*gamma*dt);
    Nb(i)=Nb(i-1)+(r2*dt)-(Nb(i-1)*gamma*dt);
end

plot(Na)
hold on
plot(Nb)
xlabel('time (min)')
ylabel('mRNA (molecules)')
legend('r=10 mRNA/min', 'r=20 mRNA/min')
hold off



%% 
%Part B

% As seen when plotting the phase diagrams corresponding to both choices of
% model, r=20 mRNA/min has a larger steady state value than r=10 mRNA/min.
% So, even though it has a faster initial increase in mRNA number, it takes
% the same time for it to reach steady state.

r1=10;       %1/min
r2=20;       %1/min
gamma=1;    %1/min
Kd=5;       %nM
omega=10;   %cooperativity constant

%Range of R1 and R2 to plot over
%for rate r1=10/min
R1_1=linspace(0,20);  %nM
R1_2=linspace(0,20);  %nM

%for rate r2=20/min
R2_1=linspace(0,20);  %nM
R2_2=linspace(0,20);  %nM

figure(1)
plot(R1_1, r1/gamma./(1+2*R1_1/Kd+(R1_1/Kd).^2*omega), '-r')
hold on
plot(r1/gamma./(1+2*R1_2/Kd+(R1_2/Kd).^2*omega), R1_2, 'Color', [1,.5,0])
plot(R2_1, r2/gamma./(1+2*R2_1/Kd+(R2_1/Kd).^2*omega), '-b')
plot(r2/gamma./(1+2*R2_2/Kd+(R2_2/Kd).^2*omega), R2_2, '-c')
xlabel('R1 (nM)')
ylabel('R2 (nM)')
legend('dR1/dt=0, r1=10/min', 'dR2/dt=0, r1=10/min', ...
    'dR1/dt=0, r2=20/min', 'dR2/dt=0, r2=20/min')

