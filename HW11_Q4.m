%HW11 Q4

%Part B

% We want to plot the lines in the R2/R1 space for which dR1/dt=0 and 
% dR2/dt=0. These lines are called "null clines"

% Parameters
r=0.5;      % in nM/min
r0=0.01;    % in nM/min
gamma=0.1;  % in 1/min
Kd=5;       % nanoMolar
omega1=1;   % cooperative binding
omega10=10; % cooperative binding

%Remember that the time scale fo the system is dictated by the degradation
%rate gamma and not the production rate r.

% Range of R1 and R2 to plot over
R1=linspace(0,20);  % Vector with 100 points between 0 and 20. nM
R2=linspace(0,20);  % nM

figure(1)
plot(R1, r/gamma./(1+2*R2/Kd+(R2/Kd).^2*omega1), '-r')
hold on
% Recall that R2 is the y axis in this case!
plot(r/gamma./(1+2*R1/Kd+(R1/Kd).^2*omega1), R2, 'Color', [1,.5,0])
plot(R1, r/gamma./(1+2*R2/Kd+(R2/Kd).^2*omega10), '-b')
plot(r/gamma./(1+2*R1/Kd+(R1/Kd).^2*omega10), R2, '-c')
xlabel('R1 (nM)')
ylabel('R2 (nM)')
legend('dR1/dt=0, omega=1', 'dR2/dt=0, omega=1', ...
    'dR1/dt=0, omega=10', 'dR2/dt=0, omega=10')




%Part D

%This isn't done, but I tried my best

%Erase the information in R1 and R2 coming from the
%previous section
R1=[];
R2=[];

%Use the Euler method
dt=0.01;        %min
TotalTime=50;   %min
%Remember that the time scale of the system is
%dicated by the degradation rate gamma and not
%the production rate r.

%Initialize the R1 and R2 values
R1(1)=18;
R2(1)=15;

%Now we need to write a for-loop to calculate the
%values of R1 and R2 at time point i based on their
%values at time point i=1
NTimePoints=TotalTime/dt;
for i=2:NTimePoints
    %Solve for omega=1
    R1(i)=R1(i-1)+...
        (r0+2*r0*R2(i-1)/Kd+(R2(i-1)/Kd)^2*omega1*r)/(1+2*R2(i-1)/Kd+(R2(i-1)/Kd)^2*omega1)*dt-...
        gamma*R1(i-1)*dt;
    R2(i)=R2(i-1)+...
        (r0+2*r0*R1(i-1)/Kd+(R1(i-1)/Kd)^2*omega1*r)/(1+2*R1(i-1)/Kd+(R1(i-1)/Kd)^2*omega1)*dt-...
        gamma*R2(i-1)*dt;
end

%Time vector
Time=0:dt:(TotalTime-dt);

figure(2)
plot(Time,R1,'-b')
hold on
plot(Time,R2,'-r')
hold off
xlabel('time (min)')
ylabel('R1 or R2 (nM)')
legend('R1','R2')



figure(1)
hold on
plot(R1,R2,'ok')
hold off


