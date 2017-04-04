
s = 1;
% stim = 13;
chanum = 128;
samplepoint = 4000;

trialnum = length(find(allgoodevents(s,:)==1));
eegdata = reshape(onedata(s,:,:,find(allgoodevents(s,:)==1)),chanum,samplepoint, trialnum); 
eeglabel = allevents(s, find(allgoodevents(s,:)==1))';

D1 = eegdata(:,:,find(eeglabel == 13));
D2 = eegdata(:,:,find(eeglabel == 23));
W = csp(D1, D2);

[m,n,k1]=size(D1); [~,~,k2]=size(D2); k = 2 * min(k1,k2);
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
   for j=1:dim
       f(i,j) = log(var(z_csp(j,:)/sum));
   end
end

train = f(1:40,:);
test = f(41:k,:);
label = eeglabel(1:40);
group = eeglabel(41:k);
svmstruct = svmtrain(train, label);
predict = svmclassify(svmstruct,test);
accu = length(find(predict == group))/(k-40);