%I'm going to create a counter that counts how many times my random number
%was over 0.5.

Ntries=100;
Counter=0;

for i=1:Ntries
    RandNum=rand;
    if RandNum>0.5
        Counter=Counter+1;
    end
end

Counter
