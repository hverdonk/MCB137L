%HW11 Q2

%Saturation Effect:

%The more excess mutants you have compared to your number of loci, the more 
%likely it is that your mutants will map to at least one of the loci. At 
%some point, you will have so few loci that all of your mutants will map to
%at least one, and mapping more would be a waste of time and energy.

%Conversely, if you have a number of loci that approaches/exceeds your
%number of mutants (such as in the case where you have 272 mutants mapping 
%to 200 loci), it is valuable to continue generating and mapping more
%mutants, because there's a chance you may not have mapped all 200.



M=272; %number of mutants mapped
loci=5000; %number of known loci
N=0:loci; %vector of previously identified loci that the mutants map to
%Disregard the case where they map to 0 previously identified loci, because
%it does not contribute to the expected value

P_unmapped=zeros(loci+1, 1);
P_unmapped(1)=0; %index=N-1

%how many different ways can I not hit the locus after doing M mutations 
%and checking the locus M times
for i=2:loci+1
    P_unmapped(i)=(1-(1/(i-1)))^M;
end

%probability that a mutated locus will be mapped
P_mapped=1-P_unmapped;


for i=1:loci+1
    expectedMaps(i)=N(i)*P_mapped(i);
end


plot(N, expectedMaps)
xlabel('Total Number of Loci')
ylabel('Expected Number of Mapped Loci')
