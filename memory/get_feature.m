
% s = 1;
% stim = 13;
chanum = 128;
samplepoint = 4000;
% iter = 1000;
% accu = zeros(2,iter,1);

for s=1:2
    trialnum = length(find(allgoodevents(s,:)==1));
    eegdata = reshape(onedata(s,:,:,find(allgoodevents(s,:)==1)),chanum,samplepoint, trialnum); 
    eeglabel = allevents(s, find(allgoodevents(s,:)==1))';

    class1trials = find(eeglabel == 13);
    class2trials = find(eeglabel == 23);
    D1 = eegdata(:,:,class1trials); 
    D2 = eegdata(:,:,class2trials);
    
%     for iteration = 1:iter
%     iteration

    [m,n,k1]=size(D1); [~,~,k2]=size(D2); k = (k1+k2);
    rp = randperm(min(k1,k2));  % produce k random integers to select the train set and test set 

    % all trials are divided into 2 classes, whithin one class, train set and 
    % test set can be divided into 7:3
    chosenindex = rp(1:ceil(3*k/10));  
    train1 = D1(:,:,chosenindex); train2 = D2(:,:,chosenindex);
    W = csp(train1, train2);


    % using W to project data of each trial
    dim = 60; f = zeros(k,dim); z_csp = zeros(dim,n);
    for i=1:k
       z = W*eegdata(:,:,i);
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

       % get the feature matrix f
       for j=1:dim
           f(i,j) = log(var(z_csp(j,:)/sum));
       end
    end

%     end
end