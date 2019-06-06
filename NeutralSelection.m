%Simulating the Buri Experiment (Neutral Selection)

Nalleles=32;
NGenerations=50;

%Define a vector to keep track of the number of bw75 alleles per generation
N75=zeros(NGenerations,1);
%Define the initial condition
N75(1)=Nalleles/2; %Half the alleles are initially bw75

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

figure(1)
plot(N75)
xlabel('generations')
ylabel('number of bw75 alleles')
ylim([0, Nalleles])



