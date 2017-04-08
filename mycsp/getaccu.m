
% get_f.m is the feature extraction module 
% input : data(train or test) channel * sample point * trial
%         label contrains two classes
% output : feature matrix (for each trial, there is a feature vector)

function accu = getaccu(data, label)

% compute the project matrix W

[m,n,k]=size(data);
D1 = data(:,:,find(label == 1));
D2 = data(:,:,find(label == 2));
W = csp(D1,D2);

% compute the common spatial patterns and features of each trial
%%=============================================================%%
dim = 2; f = zeros(k,dim); z_csp = zeros(dim,n);
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
   for j=1:dim
      sum = var(z_csp(j,:));   % sum of variance of all chozen csps 
   end
   for j=1:dim
       f(i,j) = log(var(z_csp(j,:)/sum));
   end
end

% divide data and label for train and test respectively
% ===================================================================%%
r = 0.7; % r is the rate between train and test 8
gap = k/10; 

% cross validation
accu = 0;
for i=0:(10-10*r)
    train = f(gap*i+1 : (10*r+i)*gap,:);
    test = f(setdiff(1:k,gap*i+1:(10*r+i)*gap),:);
    label = label(gap*i+1 : (10*r+i)*gap);
    group = label(setdiff(1:k,gap*i+1:(10*r+i)*gap));
    svmstruct = svmtrain(train, label);
    predict = svmclassify(svmstruct,test);
    accu = accu + length(find(predict==group))/length(predict);
end
accu = accu/(10-10*r+1);

end