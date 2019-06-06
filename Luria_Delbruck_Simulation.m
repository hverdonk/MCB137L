%Simulate the Luria-Delbruck experiment using the random simulation
%hypothesis

clear all

%Parameters
Ntubes=100;     
Ngen=10;        %# generations
r=1E-3;         %mutation probability per division

%For-loop that keeps track of the tubes
for i=1:Ntubes
    Cells=0;
    %For-loop simulating the mutations within one tube
    for j=1:Ngen
        Daughters=Cells;
        %Now, decide whether each daughter cell mutated or not
        %Flip as many coins as elements in the Daughters vector
        CoinFlips=rand(1, length(Daughters));
        %Decide whether this cell will mutate or stay the same based on r
        Mutated=CoinFlips<r;
        %Now update the Daughters vector based on the mutation outcome.
        %Note that I also need to account for whether there was already a
        %mutated cell by using the OR command "|"
        Daughters=Mutated|Daughters;
        %Update the new mother cells
        Cells=[Cells, Daughters];
    end
    %Get the total number of mutant cells in this tube
    NMutants(i)=sum(Cells);
end


histogram(NMutants)
xlabel('number of mutant cells')
ylabel('number of tubes')

%Compare the mean and variance
mean(NMutants)
var(NMutants)
