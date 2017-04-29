
% get_f.m is the feature extraction module for csp
% input : data(train or test) channel * sample point * trial
%         label contrains two classes
% output : feature matrix (for each trial, there is a feature vector)
%          k is the trial number 

function f = get_f(data, label)
    % compute the project matrix W
    [m,n,k]=size(data);
    D1 = data(:,:,find(label == 1));
    D2 = data(:,:,find(label == 2));
    W = csp(D1,D2);

    % compute the common spatial patterns and features of each trial
    dim = 4; f = zeros(k,dim); z_csp = zeros(dim,n);
    for i=1:k
       z = W*data(:,:,i);
       j=1;
       for t=1:dim   % choose the first dim/2 and last dim/2 csps of z
         if(mod(t,2)==0)
            z_csp(t,:) = z(m-j,:);
            j = j+1;
         else 
            z_csp(t,:) = z(j,:);
         end
       end
       s = sum(var(z_csp,0,2));   % sum of variance of all chozen csps 
       f(i,:) = log(var(z_csp,0,2)/s);
    end
end