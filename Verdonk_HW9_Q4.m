% HW9 Q4

% Part A

%Parameters
Ntubes=100;     
Ncells=100;     %number of cells per tube


%Mutation Data
r1=0.1E-3;         %mutation probability per division
tenth=mutCounter(r1, Ntubes, Ncells);

r2=0.5E-3;         %mutation probability per division
half=mutCounter(r2, Ntubes, Ncells);

r3=1E-3;           %mutation probability per division
one=mutCounter(r3, Ntubes, Ncells);

r4=5E-3;          %mutation probability per division
five=mutCounter(r4, Ntubes, Ncells);

r5=10E-3;         %mutation probability per division
ten=mutCounter(r5, Ntubes, Ncells);

means=[mean(tenth), mean(half), mean(one), mean(five), mean(ten)];
vars=[var(tenth), var(half), var(one), var(five), var(ten)];

scatter(vars, means)
xlabel('Variance (Cells)')
ylabel('Mean Number of Mutants (Cells)')


% A characteristic of the Poisson Distribution is that the ratio between 
% the mean and the variance is 1. Therefore, if these data follow a Poisson
% distribution, then their scatter plot should have a slope of
% approximately 1.


hold on
x=0:1;
y=x;
plot(x, y);
hold off



% Part B

% I find that using roughly ten tubes best approximates the Poisson
% Distribution.

r=0.5E-2;
NMutants=mutCounter(r, 10, Ncells);
n=0:10;
lambda=Ncells*r;
analytical=((lambda.^n)./factorial(n))*exp(-lambda);

histogram(NMutants,'Normalization','Probability')
hold on
plot(n, analytical)
xlabel('Number of mutant cells')
ylabel('Probability of seeing that number of mutant cells')
xlim([0,5])







function mutant_counts = mutCounter(mutRate, num_tubes, num_cells)
    mutant_counts=zeros(num_tubes);
    for i=1:num_tubes
        %Now, decide whether each cell mutated or not. Flip one coin for 
        %each cell
        CoinFlips=rand(1, num_cells);
        %Decide whether this cell will mutate or stay the same based on r
        Mutated=CoinFlips<mutRate;
        mutant_counts(i)=sum(Mutated);
    end
end
