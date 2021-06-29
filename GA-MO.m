function f =  stack_effect5(x)
 
C_stack=247.5*2*(x(3)*x(4)+x(3)*x(5));
C_drystorage=247.5*2*(2*x(4)+2*x(6));
A1=C_stack+C_drystorage;
IC=3*A1; % instalation cost
f(1)=(A1+IC);%/(f-1)*(((1+f)/(1+i))^N-1);
 
g=9.81;
Cd=0.65;
x(1)=150*Vdot^2-180*Vdot+368;
  
f(2)=x(1);

fitnessfcn = @f(1)[,f(2)];
nvars = 6;
lb = 340 299 4 0.52 0.3 0.6;
ub = 358 306 10 0.72 0.5 0.6;
rng default % for reproducibility
x = gamultiobj(fitnessfcn,nvars,[5],[],[],[],lb,ub)

plot(f(1),f(2),'r*')
xlabel('f(1)')
ylabel('f(2)')
title('Pareto Front')
legend('Pareto front')
