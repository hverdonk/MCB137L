%Modelling a Constitutively Expressed Gene

%Let's consider two different cases: One where we start with no mRNA
%molecules, and one where we start with 20 mRNA molecules

%Model Parameters
N0a=0;      %mRNA molecules at t=0
N0b=20;     %mRNA molecules at t=0
r=10;       %mRNA/min
gamma=1;    %in 1/min
dt=0.1;     %in minutes
tmax=20;    %in minutes

%Create Matrices
Na=zeros(tmax/dt);
Nb=zeros(tmax/dt);

%Seed each matrix with its respective initial condition
Na(1)=N0a;
Nb(1)=N0b;

for i=2:tmax/dt
    Na(i)=Na(i-1)+(r*dt)-(Na(i-1)*gamma*dt);
    Nb(i)=Nb(i-1)+(r*dt)-(Nb(i-1)*gamma*dt);
end

plot(Na)
hold on
plot(Nb)
xlabel('time (min)')
ylabel('mRNA (molecules)')
legend('0 mRNA initially', '20 mRNA initially')
hold off

%To estimate the time to reach steady state, I'm going to plot a horizontal
%line at r/gamma.

hold on
plot(ones(tmax/dt,1)*r/gamma, '--k')
%Prof Garcia plotted this as plot(ones(tmax/dt,1)*r/gamma*2/3, '--k'), and
%only had the bottom half of the original curve. Not sure why.
hold off
