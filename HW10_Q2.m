%HW10, Q2

%Part A
p=0:0.1:1;  % Vector of fractions from 0 to 1
H=2.*p.*(1.-p); % the heterozygosity of one locus with two alleles as a 
             % function of p (the fraction of one allele)

plot(p, H)
xlabel("Proportion of the major allele A")
ylabel("Fraction of heterozygous individuals within the population")

% The maximum possible heterozygosity H is 0.5, or 50% of the population.
% It occurs when p=0.5


%Part B

%From the table, I can see that there are 20 generations, including the
%first generation (because there are 20 rows in the table)

%Each generation gets its own datapoint on the future plot.

data = csvread("BuriData.csv");

generations=0:19;   % Vector to keep track of generations, starting from 0
Heterozygosity=zeros(20, 0);   % Vector for tracking heterozygosity across 
                            % each of the 20 generations.
                            
for i=1:20 %for each generation (ie row in the table)
    N_alleles=32;   % Total number of alleles
    N_bw75=0:32; % All possible amounts of bw75 alleles a vial can have
    P_Nbw75=data(i,:)./107; % Vector tracking probability of getting a vial in
                          % generation i with a given number of bw75 alleles
                          % corresponding to its position in the vector
                          % (e.g. the first item in the vector is the
                          % probability of choosing a vial at random with 0
                          % bw75 alleles).
    
    N_bw75_avg=sum(N_bw75.*P_Nbw75);
    N_bw75_avg_squared=sum((N_bw75.^2).*P_Nbw75);
    
    p=(1/N_alleles)*N_bw75_avg;
    p_squared=(1/(N_alleles^2))*N_bw75_avg_squared;

    Heterozygosity(i)=(2*p)-(2*p_squared);
end


plot(generations, Heterozygosity)
xlabel("Generation")
ylabel("Heterozygosity")
xlim([0,19])




% Part C

% Ne must be small because for larger populations, random changes in allele
% frequency affect a smaller proportion of individuals. If N is too large,
% genetic drift is unlikely to randomly fix an allele and the model will 
% not match the data.

H0=0.5;  % Heterozygosity at generation 0
Ne=19;   % Number of individuals in the population
He=H0*(1-(1/Ne)).^generations;

hold on
plot(generations, He)
legend("Buri Data", "Wright-Fisher Model")



