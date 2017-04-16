% combine emd and csp features
function [accu,sd] = emdcsp_comb(amp,angl,train_f_m,test_f_m,label_m,group_m,eeglabel)
    r=0.7;
    [epoch,~] = size(amp);
    emdf = cat(2,amp,angl);
    class1emdf = emdf(find(eeglabel==1),:);
    class2emdf = emdf(find(eeglabel==2),:);
    train_f_emd = cat(1,class1emdf(0.3*epoch/2+1:end,:),class2emdf(0.3*epoch/2+1:end,:));
    test_f_emd = cat(1,class1emdf(1:0.3*epoch/2,:),class2emdf(1:0.3*epoch/2,:));
    accu_sum = zeros(10,1);
    for i=1:10
        trainfeature = cat(2,train_f_emd, train_f_m(:,:,i));
        testfeature = cat(2,test_f_emd, test_f_m(:,:,i));
        svmstruct = svmtrain(trainfeature,label_m(:,1));
        predict = svmclassify(svmstruct,testfeature);
        accu_sum(i) = length(find(predict == group_m(:,1)))/(0.3*epoch);
    end
    accu = mean(accu_sum);
    sd = std(accu_sum);
    
    