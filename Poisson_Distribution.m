%Exploring the Poisson Distribution

%We want to plot the Poisson distribution and examine its variance and mean

%Parameters:
N=100;          %number of cells
r=0.02;         %mutation probability
lambda=N*r;     %mean number of mutant colonies (or cells)

%I'm going to plot the probability of having n mutants as a function of n.
%Let's define an n-range
nRange=0:100;
%Calculate the Poisson distribution
P=lambda.^nRange./factorial(nRange)*exp(-lambda);

figure(1)
bar(nRange, P)
xlabel('Number of Mutant Colonies')
ylabel('Probability')
xlim([0,15])


%Let's check that the distribution is normalized. If the sum of all
%probabilities is 1, then it's normalized
sum(P)

%Calculate the mean
sum(nRange.*P)
%Calculate the variance
sum(nRange.^2.*P)-sum(nRange.*P)^2
