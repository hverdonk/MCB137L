% Buri Experiment Simulations

% Compute the probability distribution for the Buri experiment as a function
% of time.

%Parameters
N=32; %total number of alleles

% Use the binomial distribution (Wright-Fisher) to populate the transition
% matrix M

M=zeros(N+1, N+1);
% Because it's a matrix, I need two for-loops

for i=0:N   % Number of bw75 alleles in the previous generation. This moves
            % along the columns
    for j=0:N   % Number of bw75 alleles in the current generation. This
                % moves along the rows
        M(j+1, i+1) = nchoosek(N,j)*((i/N)^j)*((1-i/N)^(N-j));
    end
end

% Now simulate the dynamics of the Buri experiment. Define matrix P, where
% row j, column n corresponds to P(j-1, gen=n-1)

P(:,1)=zeros(N+1, 1); %Fill first column with zeros
P((N/2)+1, 1)=1; %All tubes start with 16 bw75 alleles.

% How many generations to simulate
NGen=50;

% Loop through generations
for n=0:NGen
    %"Propagate" my population
    NewP=(M^n)*P;
    %plot it
    figure(1)
    bar(0:N, NewP)
    xlabel('number of bw75 alleles')
    ylabel('probability')
    title(n)
    drawnow
    pause
end
