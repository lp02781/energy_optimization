%22.5282 24.3894 normalisasi jadi = 0 1
%49.8416 56.8484 normalisasi jadi = 0 1
%1110.61 1691.27 normalisasi jadi = 0 1


nvars=2;
lb=[0 0];
ub=[1 1];

[x, fval] =gamultiobj(@model_2,nvars,[],[],[],[],lb,ub)

s = model_2(x)

a = [x(1,1)*1.8612+22.5282 x(1,2)*7.0068+49.8416;
    s*580.6600+1210.61 1]