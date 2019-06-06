%HW8 - Q2 
%Hannah Verdonk

%Part A

%Going term-by-term through the master equation, I can see the following:

%P(n, t) is the probability of being at length 2, given our position and time

% +rP(n-1, t)dt is the probability that, at the last time point, we added 
%               on another monomer to reach our current length of n segments

% -rP(n,t)dt is the probability of adding a monomer, thereby leaving the 
%            state of having n monomers

% +gammaP(n+1,t)dt is the probability that, at the last time point, we 
%                  removed a monomer to reach our current length of n segments

% -gammaP(n,t)dt is the probability of removing a monomer, thereby leaving 
%                the state of having n monomers


%Part B

%Model Parameters
r=1;            %in 1/s
gamma=1.1;      %in 1/s
Nfilaments=100; %total number of monomers in a filament - 1
TotalTime=100;   %in s
Nsteps=TotalTime/dt; %number of timepoints

%Simulation Paramters
dt=(1/gamma)/10;    %in s

Pmatrix=zeros(Nfilaments,Nsteps); % #rows, #columns

%at time t=0, there are no filaments
Pmatrix(1,1)=1; 

%there should be no chance of having filaments at time t=0
Pmatrix(2:Nfilaments,1)=0; 

for t=2:Nsteps
    %First Bin
    Pmatrix(1, t)=Pmatrix(1,t-1)-r*dt*Pmatrix(1, t-1)+gamma*dt*Pmatrix(2,t-1);
    for n=2:(Nfilaments-1)
        Pmatrix(n,t)=Pmatrix(n,t-1)+r*dt*Pmatrix(n-1,t-1)-r*dt*Pmatrix(n,t-1)-gamma*dt*Pmatrix(n,t-1)+gamma*dt*Pmatrix(n+1,t-1);
    end
    %Last Bin
    Pmatrix(Nfilaments,t)=Pmatrix(Nfilaments,t-1)+r*dt*Pmatrix(Nfilaments-1,t-1)-r*dt*Pmatrix(Nfilaments,t-1)-gamma*dt*Pmatrix(Nfilaments,t-1);
end

%Plot the distribution around a filament length of 100 monomers
PVector = 1:Nfilaments;
bar(PVector, Pmatrix(:, Nsteps))
xlabel('Filament Length (# of monomers)')
ylabel('Probability of Having a Filament x Monomers Long')

%Part C
%Now I change the parameters to achieve steady-state with my model
%Model Parameters
r=1;            %in 1/s
gamma=1.1;      %in 1/s
dt=0.1;         %in s
Nfilaments=100; %total number of monomers in a filament - 1
TotalTime=1000;  %in s
Nsteps=TotalTime/dt; %number of timepoints

%Simulation Paramters
dt=(1/gamma)/10;    %in s

Pmatrix=zeros(Nfilaments, Nsteps); % #rows, #columns

%at time t=0, there are no filaments
Pmatrix(1,1)=1; 

%there should be no chance of having filaments at time t=0
Pmatrix(2:Nfilaments, 1)=0; 

for t=2:Nsteps
    %First Bin
    Pmatrix(1,t)=Pmatrix(1,t-1)-r*dt*Pmatrix(1,t-1)+gamma*dt*Pmatrix(2,t-1);
    for n=2:(Nfilaments-1)
        Pmatrix(n,t)=Pmatrix(n,t-1)+r*dt*Pmatrix(n-1,t-1)-r*dt*Pmatrix(n,t-1)-gamma*dt*Pmatrix(n,t-1)+gamma*dt*Pmatrix(n+1,t-1);
    end
end

%Plot the distribution around a filament length of 100 monomers
PVector = 1:Nfilaments;
bar(PVector, Pmatrix(:, Nsteps))
xlabel('Filament Length (# of monomers)')
ylabel('Probability of Having a Filament x Monomers Long')

%Part D
%Please see paper homework

%Part E
hold on
P_theoretical = (1-(r/gamma))*((r/gamma).^PVector);
plot(PVector, P_theoretical, '-r', 'LineWidth', 3)
hold off

