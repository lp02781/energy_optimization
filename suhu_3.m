irismod = xlsread("haha.xlsx");
x = zeros(1,2);
z = zeros(1,8);
y = zeros(1,8);
p = zeros(1,8);
r = zeros(1,1);

err = zeros(1);
err = 10;
alpha = 0.1;
max_epoch = 4000;
error_tot=zeros(1,max_epoch);
epoch=0;
error_target = 0.58;
status = 1;

%variable
input = irismod(:,[1 2]);
target = irismod(:, [3]);

[len_in_rows, len_in_cols] = size(input);
[len_out_rows, len_out_cols] = size(target);

%karena input outputnya nggak ternormalisasi, maka harus dinormalisasi.
%metode : minmaxing
%input
for m = 1 : len_in_rows
    for n = 1 : len_in_cols
       input(m,n) = (input(m,n) - min(input(:,n)))/(max(input(:,n)) - min(input(:,n)));
    end
end
%output
for m = 1 : len_out_rows
    for n = 1 : len_out_cols
       target(m,n) = (target(m,n) - min(target(:,n)))/(max(target(:,n)) - min(target(:,n)));
    end
end

v = rand(2,8);
w = rand(8,8);
k = rand(8,8);
m = rand(8,1);

%proses inisialisasi bobot input dgn Nguyen-Widrow
beta = 0.7*(8).^(1/4);
a = -0.5;
b = 0.5;
v = (b-a).*rand(2, 8) +a;
norm_vj = zeros(1, 2);
for j = 1:2
    norm_vj(j) = sqrt(sum(v(:,j).^2));
    v(:,j) = (beta.*v(:,j))/norm_vj(j);
end

%inisialisasi bias
bias = (2*beta).*rand(1, 1) -beta;
%bias = 0

miu = 0.0001;
derrdw_old = 0;
derrdv_old = 0; 
derrdm_old = 0;
derrdk_old = 0;

while(status == 1)
    for i = 1:1728;
        x = input(i,:);
        zin = x*v + bias;
        z = sigmoid(zin);
        yin = z*w;
        y = sigmoid(yin);
        pin = y*k;
        p = sigmoid(pin);
        rin = p*m;
        r = sigmoid(rin);
        
        derrdr = 2*(rin-target(i,:));
        drdrin = r.* (1-r);
        drindm = p;
        derrdm = (derrdr.*drdrin)'*drindm;
    
        drindp = m;
        dpdpin = p.* (1-p);
        dpindk = y;
        derrdk = ((derrdr .* drdrin * drindp') .*dpdpin)' * dpindk;
        
        dpindy = k;
        dydyin = y.* (1-y);
        dyindw = z;
        derrdw = (((derrdr .* drdrin * drindp') .*dpdpin * dpindy') .* dydyin)' * dyindw;
        
        dyindz = w;
        dzdzin = z.* (1-z);
        dzindv = x;
        derrdv = ((((derrdr .* drdrin * drindp') .*dpdpin * dpindy') .* dydyin * dyindz') .*dzdzin)' * dzindv;
        
        %momentum update
        momentum_m = miu*alpha*derrdm_old';
        momentum_k = miu*alpha*derrdk_old';
        momentum_w = miu*alpha*derrdw_old';
        momentum_v = miu*alpha*derrdv_old';
        
         %bias update
        bias = bias - alpha*bias;

        m = m - alpha * derrdm' + momentum_m;
        k = k - alpha * derrdk' + momentum_k;
        w = w - alpha * derrdw' + momentum_w;
        v = v - alpha * derrdv' + momentum_v;   
        
        derrdw_old = derrdw;
        derrdv_old = derrdv;
        derrdm_old = derrdm;
        derrdk_old = derrdk;     
    end
    
    epoch = epoch+1
    err = sum((r - target(i,:)).^2);
    error_tot(1,epoch) = err;
    if epoch >= max_epoch
        status = 0;
    end
end

real = target(1:1728,:);
x = input(1:1728,:);
zin = x*v;
z = sigmoid(zin);
yin = z*w;
y = sigmoid(yin);
pin = y*k;
p = sigmoid(pin);
rin = p*m;
r = sigmoid(rin);
err_real = sum((r - target(1:1728, :)).^2);
    
%find accuracy
pred = r;
for i = 1:1728
    mymax = max(pred(i,:));
    for j = 1:1
        if pred(i,j) == mymax
            pred(i,:) = zeros(1,1);
            pred(i,j) = 1;
        end
    end
end
true = 0;
total = 1728;
for i = 1:1728
    if real(i,:) == pred(i,:)
        true = true+1;
    end
end
acc = true/total *100

for m = 1 : 1728
    for n = 1
       target(m,n) = target(m,n)*580.6600+1110.61;
       r(m,n) = r(m,n)*580.6600+1110.61;
    end
end
plot(target)
hold on
plot(r)
legend({'real', 'predict'},'Location','northeast')
%plot(error_tot)