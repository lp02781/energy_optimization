%22.499 24.3894
%39.3224 49.8416
%346.547 1,691.27

clear

nvars=2;
lb=[1 1];
ub=[5 5];

[x, fval] =gamultiobj(@model_1,nvars,[],[],[],[],lb,ub) 
p = model(x)