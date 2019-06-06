%Solve the master equation (tells dependence of probablility distribution
%on time) for the production and degratation of mRNA molecules

%Model Parameters
r=10; %mRNAs/min
gamma=1; %min^-1

%Simulation Parameteres
dt=0.01; %min
TotalTime=10; %min
MaxM=30;    %max # of mRNAs we will consider
times=TotalTime/dt;

%Create a matrix where all of the information is going to be stored.
P = zeros(times, (MaxM+1));
% The last row of this matrix represents the system at steady state

%Initial Condition
P(1,1)=1;      %No mRNA molecules initially

for i=2:times
    for j=2:MaxM
        P(i, j) = P(i-1,j) +...
            r*dt*P(i-1, j-1) - r*dt*P(i-1, j) +...
            gamma*(j)*dt*P(i-1, j+1) - gamma*(j-1)*dt*P(i-1,j);
    end
    %First Bin
    P(i, 1) = P(i-1,1)-r*dt*P(i-1,1)+gamma*(1)*dt*P(i-1,2);
    %Last Bin (MaxM+1)
    P(i,MaxM+1) = P(i-1,MaxM+1)+r*dt*P(i-1,MaxM)-gamma*dt*MaxM*P(i-1,MaxM+1);
end

%Make a movie of the simulation
PVector = 0:MaxM;
% figure(1)
% for i = 1:TotalTime/dt
%     bar(PVector, P(i,:))
%     ylim([0,0.3])
%     drawnow
% end

%Compare the last frame of our distributions to the Poisson distribution.
%P is the data from an experimental simulation of a constitutive promoter,
%and P_theoretical is the equation we found for a Poisson Distribution that
%should model our data. Remember to use "." for elementwise matrix
%operations.
P_theoretical = 1./factorial(PVector).*(r/gamma).^PVector*exp(-r/gamma);

figure(2)
bar(PVector, P(TotalTime/dt,:))
hold on
plot(PVector, P_theoretical, '-r', 'LineWidth', 3)
hold off
    