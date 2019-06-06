%HW9 Q1

clear all

x=0:5;

plot(x, exp(x))
hold on
plot(x, 1+(0*x))
plot(x, 1+x)
plot(x, 1+x+((x.^2)/2))
plot(x, 1+x+((x.^2)/2)+((x.^3)/6))
legend('e^x', '1', '1+x', '1+x+((x^2)/2)', '1+x+((x^2)/2)+((x^3)/6)')
