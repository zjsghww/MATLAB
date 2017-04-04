function [m,s] = mean_var(d)
% 求14个受试每个导联权值的均值和方差，用来挑选最强的三个导联的数据
% input ： d - totalweight
% output : m - mean
%          s - std 标准差

m = zeros(14,4); 
s = zeros(14,4);
for i=1:14
    data = d(:,:,i);
    m(i,:) = mean(data,1);
    s(i,:) = std(data,0,1);
end