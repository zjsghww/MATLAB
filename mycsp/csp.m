% csp function of computing project matrix, for two classes classification
% input : data of the two classes , channel * sample * trial
% output :the project matrix
% author by: Zhang Jin
% created at: 2017-03-26


function W = csp(D1, D2)
    if(nargin ~= 2)
        disp('Must have 2 classes for CSP')
    end
    [~, ~, k1] = size(D1); [~,~,k2] = size(D2); k = min(k1,k2);
    c{1} = 0; c{2} = 0;  % initialize the normalized spatial covariance for single trial
    for i = 1:k
       data1 = D1(:,:,i); data2 = D2(:,:,i);  % data for one trial
       % sum the normalized spatial convariance for a single trial
       c{1} = c{1} + data1*data1'/trace(data1*data1');  % equation 1
       c{2} = c{2} + data2*data2'/trace(data2*data2');       
    end
    
    % mean of normalized spatial convariance of two classes
    c{1} = c{1}/k; c{2} = c{2}/k;
    
    %composite result
    cc = c{1} + c{2};   % equation 2
    
    % compute the eigenvectors and eigenvalues of the composite normalized
    % spatial convariance, i.e. cc
    [Uc, lamdac] = eig(cc);
    
    % sort the eigenvalues in descending order, so as the eigenvectors
    [lamdac, index] = sort(diag(lamdac), 'descend');
    Uc = Uc(:,index);
    
    % whitening transformation  equation 3
    P = sqrt(inv(diag(lamdac)))*Uc';
    
    % transform c1 and c2, so s1 and s2 could share common eigenvectors
    for k=1:nargin  % equation 4
       S{k} = P * c{k} * P';
    end  
    
    % genaralised eigenvectors/values
    [B,D] = eig(S{1}, S{2});
    
    % sort the eigenvalues and eigenvectors, B is the common part
    [~, index] = sort(diag(D));
    B = B(:,index);
    
    % whitening this common eigenvectors, then the row of results are
    % common spatial patterns
    W = B'*P;
end


