%22.499 24.3894
%39.3224 49.8416
%346.547 1,691.27

clear

nvars=2;
lb=[10 10];
ub=[100 100];

[x, fval] =gamultiobj(@model_2,nvars,[],[],[],[],lb,ub) 
p = model_2(x)