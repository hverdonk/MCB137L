% HW11 Q1
%Simulating the Buri Experiment (Neutral Selection)

%Part A
Nalleles=32;
NGenerations=100;

%Define a vector to keep track of the number of bw75 alleles per generation
N75=zeros(NGenerations,1);
%Define the initial condition
N75(1)=1; %BW75 arose initially when one allele mutated

simcounter=0; %Number of times I ran this simulation

while N75(NGenerations)~=32
    %Loop over generations
    for i=2:NGenerations
        %Loop over alleles out of my gamete pool
        for j=1:Nalleles
            %Calculate the probability of grabbing a bw75 allele
            p75=N75(i-1)/Nalleles;
            %Determine whether I grab a bw75 allele or not
            if p75>rand
                N75(i)=N75(i)+1;
                %We don't care about keeping track of what the previous 
                %generation's N75s used to be, only the proportion of alleles
            end
        end
    end
    simcounter=simcounter+1;
end

figure(1)
plot(N75)
xlabel('generations')
ylabel('number of bw75 alleles')
ylim([0, Nalleles])

%The first time I ran this code, I was lucky and it only took me 4 tries
%before I got a fixation event. 
%P_fixation = 1 fixation event/4 tries to reach fixation = 0.25



%%
%Part B

%tracks how many fixation events occurred for a population of a given size
fixation_vector=zeros(50,1);

for popsize=2:2:100
    for Ntries=1:100
        NGenerations=100;
        
        %Define the initial condition. BW75 arose initially when one allele mutated
        lastN75=1; % How many BW75 alleles there were in the last generation
        currN75=0; % How many BW75 alleles there are in this generation
        
        %Loop over generations
        for i=2:NGenerations
            %Loop over alleles out of my gamete pool
            for j=1:popsize
                %Calculate the probability of grabbing a bw75 allele
                p75=lastN75/popsize;
                %Determine whether I grab a bw75 allele or not
                if p75>rand
                    currN75=currN75+1;
                    %We don't care about keeping track of what the previous 
                    %generation's N75s used to be, only the proportion of alleles
                end
            end
            lastN75=currN75;
            currN75=0;
        end
        if lastN75==popsize
            fixation_vector(popsize/2)=fixation_vector(popsize/2)+1;
        end
    end
end

% Probability based on number of fixation events in 100 trials for each 
% population size
PFixation=fixation_vector/100;

figure(2)
plot(2:2:100, PFixation)
xlabel('Population Size')
ylabel('Fixation Probability')

