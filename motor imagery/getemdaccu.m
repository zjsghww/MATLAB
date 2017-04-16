function [meanaccu_amp,sd_amp,meanaccu_angl,sd_angl] = getemdaccu(data,label)
    [amp,angl] = get_emd_f(data);
    accu_amp = zeros(3,10);
    sd_amp = zeros(3,1);
    meanaccu_amp = zeros(3,1);
    accu_angl = zeros(3,10);
    sd_angl = zeros(3,1);
    meanaccu_angl = zeros(3,1);
    for j = 1:3
      for i=1:10
        epoch = size(amp,1);
        rp = randperm(epoch);
        svmstruct = svmtrain(amp(rp(1:epoch),j),label(rp(1:epoch)));
        predict = svmclassify(svmstruct,amp(rp(0.7*epoch:end),j));
        accu_amp(j,i) = length(find(predict == label(rp(0.7*epoch:end))))/(0.3*epoch+1);
        svmstruct = svmtrain(angl(rp(1:epoch),j),label(rp(1:epoch)));
        predict = svmclassify(svmstruct,angl(rp(0.7*epoch:end),j));
        accu_angl(j,i) = length(find(predict == label(rp(0.7*epoch:end))))/(0.3*epoch+1);
      end 
      meanaccu_amp(j) = mean(accu_amp(j,:));
      sd_amp(j) = std(accu_amp(j,:));
      meanaccu_angl(j) = mean(accu_angl(j,:));
      sd_angl(j) = std(accu_angl(j,:));
    end

    








% % figure;
% % for i=1:length(imf)
% % plot(pwelch(imf{i}))
% % hold on;
% % end
% 
% % function emdfeatures = getemdfeatures(eegdata)
% data = transpose(squeeze(mean(eegdata,1))); %30x512
% % data = transpose(squeeze(eegdata(4,:,:)));
% [epoch,sp] = size(data); 
% chosenimf = [];
% for i=1:epoch
%    imftemp=emd(data(i,:)); 
%    b=reshape(cell2mat(imftemp(1:3)),512,3);
%    chosenimf(:,:,end+1) = b';
%    i
% end
% chosenimf = chosenimf(:,:,2:end);
% 
% f = transpose(squeeze(sum(power(chosenimf,2),2)));
% %====================== var ================================
% s = squeeze(sum(var(chosenimf,0,2),1));
% s = s*ones(1,3);
% fvar = transpose(squeeze(var(chosenimf,0,2)))./s;
% 
% %====================== SD ================================
%  m = squeeze(sum(chosenimf,2))/sp;
%  sd = zeros(epoch,3);
% for i=1:epoch
%    meanval = m(:,i)*ones(1,sp);
%    sd(i,:) = sum(power((chosenimf(:,:,i)-meanval),2),2)/sp;
% end
% %====================== Feature 5 ================================
%  m = squeeze(sum(chosenimf,2))/sp;
%  phea = zeros(epoch,3);
%  sdt = sd';
% for i=1:epoch
%    meanval = m(:,i)*ones(1,sp);
%    sdval = sdt(:,i)*ones(1,sp);
%    phea(i,:) = sum(power((chosenimf(:,:,i)-meanval),3)./sdval,2)/sp;
% end
% 
% 
% 
% % svmstruct = svmtrain(f(1:40,:),eeglabel(1:40));
% % predict = svmclassify(svmstruct, f(41:end,:));
% % accu = sum(predict == eeglabel(41:end))/20;
% 
% 
