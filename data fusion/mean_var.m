function [m,s] = mean_var(d)
% ��14������ÿ������Ȩֵ�ľ�ֵ�ͷ��������ѡ��ǿ����������������
% input �� d - totalweight
% output : m - mean
%          s - std ��׼��

m = zeros(14,4); 
s = zeros(14,4);
for i=1:14
    data = d(:,:,i);
    m(i,:) = mean(data,1);
    s(i,:) = std(data,0,1);
end