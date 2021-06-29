function y = model(x,v,w)

zin = x*v;
z = sigmoid(zin);
yin = z*w;
y = sigmoid(yin);

y = sigmoid(sigmoid(x*v)*w);

%function y = simple_fitness(x)
%    y = 100 * (x(1)^2 - x(2)) ^2 + (1 - x(1))^2;