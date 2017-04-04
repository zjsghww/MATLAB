function [a, b] = maxn(A, n)
% 求数组A的最大的前n个数
%input ： A - 一维数组
%         n 
%output ： a - 最大的前n个数
%          b - 最大的前n个数的下标

As = sort(A,'descend');
a = As(1:n);  
b = zeros(1,n);
for i=1:n
    b(i) = find(A == As(i));
end

