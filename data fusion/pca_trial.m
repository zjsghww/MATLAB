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

%去除直流成分
X = X-ones(size(X,1),1)*mean(X);

% Calculate the eigenvalues and eigenvectors of the new covariance matrix.
covarianceMatrix = X*X'/size(X,2); %求出其协方差矩阵
%E是特征向量构成，它的每一列是特征向量，D是特征值构成的对角矩阵
%这些特征值和特征向量都没有经过排序
[E, D] = eig(covarianceMatrix); 

% Sort the eigenvalues  and recompute matrices
% 因为sort函数是升序排列，而需要的是降序排列，所以先取负号,diag(a)是取出a的对角元素构成
% 一个列向量，这里的dummy是降序排列后的向量，order是其排列顺序
[dummy,order] = sort(diag(-D));
E = E(:,order);%将特征向量按照特征值大小进行降序排列，每一列是一个特征向量
Y = E'*X;
d = diag(D); %d是一个列向量
%dsqrtinv是列向量，特征值开根号后取倒,仍然是与特征值有关的列向量
%其实就是求开根号后的逆矩阵
dsqrtinv = real(d.^(-0.5)); 
Dsqrtinv = diag(dsqrtinv(order));%是一个对角矩阵，矩阵中的元素时按降序排列好了的特征值（经过取根号倒后）
D = diag(d(order));%D是一个对角矩阵，其对角元素由特征值从大到小构成
V = Dsqrtinv*E';%特征值矩阵乘以特征向量矩阵