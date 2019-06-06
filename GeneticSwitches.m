% Genetic Switches

% We want to plot the lines in the R2/R1 space for which dR1/dt=0 and 
% dR2/dt=0. These lines are called "null clines"

% Parameters
r=10;       % in 1/min
gamma=1;    % in 1/min
Kd=5;       % nanoMolar
omega=1;    % cooperative binding

%Remember that the time scale fo the system is dictated by the degradation
%rate gamma and not the production rate r.

% Range of R1 and R2 to plot over
R1=linspace(0,20);  % Vector with 100 points between 0 and 20. nM
R2=linspace(0,20);  % nM

figure(1)
plot(R1, r/gamma./(1+2*R2/Kd+(R2/Kd).^2*omega), '-r')
hold on
% Recall that R2 is the y axis in this case!
plot(r/gamma./(1+2*R1/Kd+(R1/Kd).^2*omega), R2, '-b') 
xlabel('R1 (nM)')
ylabel('R2 (nM)')
legend('dR1/dt=0', 'dR2/dt=0')

% The intersection point is the equilibrium point for this repressor under
% these conditions. Note that, in this case, there is only one equilibrium
% point. Changing omega to 5 results in two equilibrium points - a stable
% switch.


for i=1:length(R2)
    for j=1:length(R1)
        dR1(i,j)=(r./(1+2*R2(i)/Kd+(R2(i)/Kd).^2*omega))-gamma*R1(j);
        dR2(i,j)=(r./(1+2*R1(j)/Kd+(R1(j)/Kd).^2*omega))-gamma*R2(i);
    end
end

figure(1)
hold on
quiver(R1,R2,dR1, dR2, 'LineWidth', 1, 'MaxHeadSize', 3,...
    'AutoScaleFactor', 1.5);
xlim([0,20])
ylim([0,20])
hold off
