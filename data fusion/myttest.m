function h = myttest(X,Y)

if size(X)~=size(Y)
    error('size X is not equal to size Y');
end
n = size(X,1);
di = X-Y;
dm = mean(di);
Sd = sqrt(sum((di-dm).^2)/(n*(n-1)));
t = dm/Sd;
t8 = 2.015;
if t>t8
    h=1;
else
    h=0;
end
