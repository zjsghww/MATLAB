% mypca

function [Y,V,E,D] = pca_trial(X)

% do PCA on image patches
%
% INPUT variables:
% X                  matrix with image patches as columns
%
% OUTPUT variables:
% Y                  the project matrix of the input data X without whiting
% V                  whitening matrix
% E                  principal component transformation (orthogonal)
% D                  variances of the principal components

%ȥ��ֱ���ɷ�
X = X-ones(size(X,1),1)*mean(X);

% Calculate the eigenvalues and eigenvectors of the new covariance matrix.
covarianceMatrix = X*X'/size(X,2); %�����Э�������
%E�������������ɣ�����ÿһ��������������D������ֵ���ɵĶԽǾ���
%��Щ����ֵ������������û�о�������
[E, D] = eig(covarianceMatrix); 

% Sort the eigenvalues  and recompute matrices
% ��Ϊsort�������������У�����Ҫ���ǽ������У�������ȡ����,diag(a)��ȡ��a�ĶԽ�Ԫ�ع���
% һ���������������dummy�ǽ������к��������order��������˳��
[dummy,order] = sort(diag(-D));
E = E(:,order);%������������������ֵ��С���н������У�ÿһ����һ����������
Y = E'*X;
d = diag(D); %d��һ��������
%dsqrtinv��������������ֵ�����ź�ȡ��,��Ȼ��������ֵ�йص�������
%��ʵ�����󿪸��ź�������
dsqrtinv = real(d.^(-0.5)); 
Dsqrtinv = diag(dsqrtinv(order));%��һ���ԽǾ��󣬾����е�Ԫ��ʱ���������к��˵�����ֵ������ȡ���ŵ���
D = diag(d(order));%D��һ���ԽǾ�����Խ�Ԫ��������ֵ�Ӵ�С����
V = Dsqrtinv*E';%����ֵ�������������������