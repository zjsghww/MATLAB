function [a, b] = maxn(A, n)
% ������A������ǰn����
%input �� A - һά����
%         n 
%output �� a - ����ǰn����
%          b - ����ǰn�������±�

As = sort(A,'descend');
a = As(1:n);  
b = zeros(1,n);
for i=1:n
    b(i) = find(A == As(i));
end

