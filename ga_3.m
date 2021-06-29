%22.499 24.3894
%39.3224 49.8416
%346.547 1,691.27

clear

nvars=2;
lb=[22 24];
ub=[39 50];

[x, fval] =gamultiobj(@model_3,nvars,[],[],[],[],lb,ub) 
p = model_3(x)