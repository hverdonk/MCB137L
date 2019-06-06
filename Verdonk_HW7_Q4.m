%HW7 Q4

N=1:120;
k=100;  %in cells
r=1/20;  %in 1/min

%Production Term
P=r*N;

%Destruction Term
D=(r*(N.^2))/k;

plot(N, P)
hold on
plot(N, D)
xlabel('Number of bacteria cells (cells)')
ylabel('Change in number of cells over time (cells/min)')
legend('Production Rate', 'Destruction Rate')
hold off