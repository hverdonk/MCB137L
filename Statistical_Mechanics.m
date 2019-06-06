%Statistical Mechanics

%Plot pbound for a constitutive promoter

%First, define my parameters
Nns=5E6; % # nonspecific sites
P=linspace(0,5000); %generates 100 equally spaced points between 0 and 5000

%Now plot the first energy
deltaE=-2; %in kBT units
pbound=(P/Nns*exp(-deltaE))./(1+P/Nns*exp(-deltaE));
plot(P, pbound, '-k')
xlabel('number of RNApol molecules')
ylabel('pbound')

%Now for the second energy
deltaE=-5; %in kBT units
pbound=(P/Nns*exp(-deltaE))./(1+P/Nns*exp(-deltaE));
hold on
plot(P, pbound, '-r')

%Now for the third energy
deltaE=-10; %in kBT units
pbound=(P/Nns*exp(-deltaE))./(1+P/Nns*exp(-deltaE));
hold on
plot(P, pbound, '-g')
legend('-2', '-5', '-10')


