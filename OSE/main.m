FitnessFunction = @optann;
numberOfVariables = 2;

ub = [1,1];
lb = [-1,-1];

opts = optimoptions(@ga,'MaxStallGenerations',50,'PlotFcn',{@gaplotbestf,@gaplotstopping});

[x,fval] = ga(FitnessFunction,numberOfVariables,[],[],[],[],lb,ub,[],opts);