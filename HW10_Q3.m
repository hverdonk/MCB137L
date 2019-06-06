% HW10, Q3

% Part F

age=0:100; %in years
mut_rate=0.3; %errors/division

% Eggs have 7 mutations on average (Part B). "Every egg a woman produces
% has undergone 23 genome replications regardless of a woman?s age."
egg_mut=zeros(101,1);

for i=1:101
    egg_mut(i)=7;
end



sperm_mut=zeros(101,1);
   
for i=1:101
    year=i-1;
    if year<=15
        divisions=30; %boy is not producing mature sperm
    else
        StemDivs=(year-15)*365/16; %365 days/year, 16 days/stem cell division
        divisions=34+StemDivs;
    end
    muts=divisions*mut_rate;
    sperm_mut(i)=muts;
end

plot(age, egg_mut);
hold on
plot(age, sperm_mut);
xlabel("Age (Years)")
ylabel("# Mutations Expected")
