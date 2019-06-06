%Bicoid protein profile along the Anterior-Posterior Axis
%Hannah Verdonk

%Model Parameters
N0=100;             %number of bicoid protein molecules initially  
                    %localized at the anterior end of the embryo
D=7;                %bicoid diffusion constant in um^2/s (Abu-Arish2010)
L=500;              %length of the cell in um (given in problem)
TotalTime=20000;    %in s

%Simulation Parameters
dx=10;              %in um
B=L/dx;             %number of imaginary boxes in the E. coli cell
k=D/(dx^2);         %jump rate of a single molecule
dt=(1/k)/10;        %time step in s
gamma=1/3000;       %bicoid degradation rate in 1/(s*protein) (Drocco2011)
r=1/30;             %rate of translation in proteins/(mRNA*s)
M=7.5E5;            %number of bicoid mRNA localized at the anterior end 
                    %of the embryo

%Diffusion Matrix
N(1:B, 1:TotalTime/dt)=0;

%Seed matrix with initial condition
N(1, 1)=N0;


for j=2:TotalTime/dt
    %for-loop for boxes 2 through B-1
    for i=2:B-1
       %diffusion
       N(i, j)=N(i, j-1)-2*k*dt*N(i, j-1)+k*dt*N(i-1, j-1)+k*dt*N(i+1, j-1)...
           -gamma*dt*N(i, j-1); %degradation
    end
    %box 1
    N(1, j)= N(1, j-1)-k*dt*N(1, j-1)+k*dt*N(2, j-1)... %diffusion
        -gamma*dt*N(i, j-1)...                          %degradation
        +r*dt*M;                                        %protein production
    
    %box B
    N(B, j)=N(B, j-1)-k*dt*N(B, j-1)+k*dt*N(B-1, j-1)... %diffusion
					-gamma*dt*N(i, j-1);                 %degradation
end

%Plot the results
Box=1:B;
hold on
plot(Box, N(:,100))
plot(Box, N(:,1000))
plot(Box, N(:,5000))
plot(Box, N(:,14000))
hold off
xlabel('distance from anterior (10um units)')
ylabel('number of molecules')
legend('142s', '1428s', '7143s', '20000s')










%Measure decay constant lambda

%(All calculations done on a separate piece of paper included with the rest
%of HW6)
%From class, we know that we can estimate lambda as being 1/3 of the
%distance along the curve


%For D=7 um^2/s as above 
lambda7_estimate=161;
lambda7_calculated=145;


%For D=5 um^2/s
lambda5_estimate=136;
lambda5_calculated=122;

%Model Parameters
N0=100;             %number of bicoid protein molecules initially  
                    %localized at the anterior end of the embryo
L=500;              %length of the cell in um (given in problem)
D=5;                %bicoid diffusion constant in um^2/s
TotalTime=20000;    %in s
%Simulation Parameters
dx=10;              %in um
B=L/dx;             %number of imaginary boxes in the E. coli cell
k=D/(dx^2);         %jump rate of a single molecule
dt=(1/k)/10;        %time step in s
gamma=1/3000;       %bicoid degradation rate in 1/(s*protein) (Drocco2011)
r=1/30;             %rate of translation in proteins/(mRNA*s)
M=7.5E5;            %number of bicoid mRNA localized at the anterior end 
                    %of the embryo
%Diffusion Matrix
N(1:B, 1:TotalTime/dt)=0;
%Seed matrix with initial condition
N(1, 1)=N0;

for j=2:TotalTime/dt
    %for-loop for boxes 2 through B-1
    for i=2:B-1
       %diffusion
       N(i, j)=N(i, j-1)-2*k*dt*N(i, j-1)+k*dt*N(i-1, j-1)+k*dt*N(i+1, j-1)...
           -gamma*dt*N(i, j-1); %degradation
    end
    %box 1
    N(1, j)= N(1, j-1)-k*dt*N(1, j-1)+k*dt*N(2, j-1)... %diffusion
        -gamma*dt*N(i, j-1)...                          %degradation
        +r*dt*M;                                        %protein production
    %box B
    N(B, j)=N(B, j-1)-k*dt*N(B, j-1)+k*dt*N(B-1, j-1)... %diffusion
		-gamma*dt*N(i, j-1);                             %degradation
end

%Plot the results
Box=1:B;
plot(Box, N(:,100))
hold on
plot(Box, N(:,1000))
plot(Box, N(:,5000))
plot(Box, N(:,10000))
hold off
xlabel('distance from anterior (10um units)')
ylabel('number of molecules')
legend('200s', '2000s', '10000s', '20000s')




%For D=10 um^2/s
lambda10_estimate=193;
lambda10_calculated=173;

%Model Parameters
N0=100;             %number of bicoid protein molecules initially  
                    %localized at the anterior end of the embryo
L=500;              %length of the cell in um (given in problem)
D=10;               %bicoid diffusion constant in um^2/s
TotalTime=20000;    %in s
%Simulation Parameters
dx=10;              %in um
B=L/dx;             %number of imaginary boxes in the E. coli cell
k=D/(dx^2);         %jump rate of a single molecule
dt=(1/k)/10;        %time step in s
gamma=1/3000;       %bicoid degradation rate in 1/(s*protein) (Drocco2011)
r=1/30;             %rate of translation in proteins/(mRNA*s)
M=7.5E5;            %number of bicoid mRNA localized at the anterior end 
                    %of the embryo
%Diffusion Matrix
N(1:B, 1:TotalTime/dt)=0;
%Seed matrix with initial condition
N(1, 1)=N0;

for j=2:TotalTime/dt
    %for-loop for boxes 2 through B-1
    for i=2:B-1
       %diffusion
       N(i, j)=N(i, j-1)-2*k*dt*N(i, j-1)+k*dt*N(i-1, j-1)+k*dt*N(i+1, j-1)...
           -gamma*dt*N(i, j-1); %degradation
    end
    %box 1
    N(1, j)= N(1, j-1)-k*dt*N(1, j-1)+k*dt*N(2, j-1)... %diffusion
        -gamma*dt*N(i, j-1)...                          %degradation
        +r*dt*M;                                        %protein production
    %box B
    N(B, j)=N(B, j-1)-k*dt*N(B, j-1)+k*dt*N(B-1, j-1)... %diffusion
		-gamma*dt*N(i, j-1);                             %degradation
end

%Plot the results
Box=1:B;
plot(Box, N(:,100))
hold on
plot(Box, N(:,1000))
plot(Box, N(:,5000))
plot(Box, N(:,14000))
hold off
xlabel('distance from anterior (10um units)')
ylabel('number of molecules')
legend('142s', '1428s', '7143s', '20000s')





%For D=15 um^2/s
lambda15_estimate=240;
lambda15_calculated=212;

%Model Parameters
N0=100;             %number of bicoid protein molecules initially  
                    %localized at the anterior end of the embryo
L=500;              %length of the cell in um (given in problem)
D=15;               %bicoid diffusion constant in um^2/s
TotalTime=40000;    %in s
%Simulation Parameters
dx=10;              %in um
B=L/dx;             %number of imaginary boxes in the E. coli cell
k=D/(dx^2);         %jump rate of a single molecule
dt=(1/k)/10;        %time step in s
gamma=1/3000;       %bicoid degradation rate in 1/(s*protein) (Drocco2011)
r=1/30;             %rate of translation in proteins/(mRNA*s)
M=7.5E5;            %number of bicoid mRNA localized at the anterior end 
                    %of the embryo
%Diffusion Matrix
N(1:B, 1:TotalTime/dt)=0;
%Seed matrix with initial condition
N(1, 1)=N0;

for j=2:TotalTime/dt
    %for-loop for boxes 2 through B-1
    for i=2:B-1
       %diffusion
       N(i, j)=N(i, j-1)-2*k*dt*N(i, j-1)+k*dt*N(i-1, j-1)+k*dt*N(i+1, j-1)...
           -gamma*dt*N(i, j-1); %degradation
    end
    %box 1
    N(1, j)= N(1, j-1)-k*dt*N(1, j-1)+k*dt*N(2, j-1)... %diffusion
        -gamma*dt*N(i, j-1)...                          %degradation
        +r*dt*M;                                        %protein production
    %box B
    N(B, j)=N(B, j-1)-k*dt*N(B, j-1)+k*dt*N(B-1, j-1)... %diffusion
		-gamma*dt*N(i, j-1);                             %degradation
end

%Plot the results
Box=1:B;
plot(Box, N(:,100))
hold on
plot(Box, N(:,1000))
plot(Box, N(:,5000))
plot(Box, N(:,14000))
plot(Box, N(:,28000))
hold off
xlabel('distance from anterior (10um units)')
ylabel('number of molecules')
legend('142s', '1428s', '7143s', '20000s', '40000s')





%For D=20 um^2/s
lambda20_estimate=285;
lambda20_calculated=245;

%Model Parameters
N0=100;             %number of bicoid protein molecules initially  
                    %localized at the anterior end of the embryo
L=500;              %length of the cell in um (given in problem)
D=20;               %bicoid diffusion constant in um^2/s
TotalTime=40000;    %in s
%Simulation Parameters
dx=10;              %in um
B=L/dx;             %number of imaginary boxes in the E. coli cell
k=D/(dx^2);         %jump rate of a single molecule
dt=(1/k)/10;        %time step in s
gamma=1/3000;       %bicoid degradation rate in 1/(s*protein) (Drocco2011)
r=1/30;             %rate of translation in proteins/(mRNA*s)
M=7.5E5;            %number of bicoid mRNA localized at the anterior end 
                    %of the embryo
%Diffusion Matrix
N(1:B, 1:TotalTime/dt)=0;
%Seed matrix with initial condition
N(1, 1)=N0;

for j=2:TotalTime/dt
    %for-loop for boxes 2 through B-1
    for i=2:B-1
       %diffusion
       N(i, j)=N(i, j-1)-2*k*dt*N(i, j-1)+k*dt*N(i-1, j-1)+k*dt*N(i+1, j-1)...
           -gamma*dt*N(i, j-1); %degradation
    end
    %box 1
    N(1, j)= N(1, j-1)-k*dt*N(1, j-1)+k*dt*N(2, j-1)... %diffusion
        -gamma*dt*N(i, j-1)...                          %degradation
        +r*dt*M;                                        %protein production
    %box B
    N(B, j)=N(B, j-1)-k*dt*N(B, j-1)+k*dt*N(B-1, j-1)... %diffusion
		-gamma*dt*N(i, j-1);                             %degradation
end

%Plot the results
Box=1:B;
plot(Box, N(:,100))
hold on
plot(Box, N(:,1000))
plot(Box, N(:,5000))
plot(Box, N(:,14000))
plot(Box, N(:,28000))
hold off
xlabel('distance from anterior (10um units)')
ylabel('number of molecules')
legend('142s', '1428s', '7143s', '20000s', '40000s')





%For D=25 um^2/s
lambda25_estimate=320;
lambda25_calculated=274;

%Model Parameters
N0=100;             %number of bicoid protein molecules initially  
                    %localized at the anterior end of the embryo
L=500;              %length of the cell in um (given in problem)
D=25;               %bicoid diffusion constant in um^2/s
TotalTime=40000;    %in s
%Simulation Parameters
dx=10;              %in um
B=L/dx;             %number of imaginary boxes in the E. coli cell
k=D/(dx^2);         %jump rate of a single molecule
dt=(1/k)/10;        %time step in s
gamma=1/3000;       %bicoid degradation rate in 1/(s*protein) (Drocco2011)
r=1/30;             %rate of translation in proteins/(mRNA*s)
M=7.5E5;            %number of bicoid mRNA localized at the anterior end 
                    %of the embryo
%Diffusion Matrix
N(1:B, 1:TotalTime/dt)=0;
%Seed matrix with initial condition
N(1, 1)=N0;

for j=2:TotalTime/dt
    %for-loop for boxes 2 through B-1
    for i=2:B-1
       %diffusion
       N(i, j)=N(i, j-1)-2*k*dt*N(i, j-1)+k*dt*N(i-1, j-1)+k*dt*N(i+1, j-1)...
           -gamma*dt*N(i, j-1); %degradation
    end
    %box 1
    N(1, j)= N(1, j-1)-k*dt*N(1, j-1)+k*dt*N(2, j-1)... %diffusion
        -gamma*dt*N(i, j-1)...                          %degradation
        +r*dt*M;                                        %protein production
    %box B
    N(B, j)=N(B, j-1)-k*dt*N(B, j-1)+k*dt*N(B-1, j-1)... %diffusion
		-gamma*dt*N(i, j-1);                             %degradation
end

%Plot the results
Box=1:B;
plot(Box, N(:,100))
hold on
plot(Box, N(:,1000))
plot(Box, N(:,5000))
plot(Box, N(:,14000))
plot(Box, N(:,28000))
hold off
xlabel('distance from anterior (10um units)')
ylabel('number of molecules')
legend('142s', '1428s', '7143s', '20000s', '40000s')


%Plot of experimental and theoretical lambdas vs D
Dvals=[5,7,10,15,20,25];
experimental=[lambda5_estimate, lambda7_estimate, lambda10_estimate...
    lambda15_estimate, lambda20_estimate, lambda25_estimate];
theoretical=[lambda5_calculated, lambda7_calculated, lambda10_calculated...
    lambda15_calculated, lambda20_calculated, lambda25_calculated];

plot(Dvals, experimental)
hold on
plot(Dvals, theoretical);
hold off
xlabel('Valus of diffusion constant D (um^2/s)')
ylabel('Value of decay constant lambda (um)')
legend('measured values', 'theoretical prediction')
