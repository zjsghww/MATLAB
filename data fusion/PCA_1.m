% PCA_1

accuracy = zeros(14,1);

for j=1:14
    [eeg, label] = extractdata(dirs{j});
    eeg = eeg(:,1:2560,:);
    pcasig = zeros(4,10,60);
    for i=1:60
        data = eeg(:,:,i);
        Y = PCA_2(data');
        pcasig(:,:,i) = Y';
    end
    [~,target] = ccabycl(pcasig(1:3,:,:),[6,7,8,9],256);    
    accuracy(j) = sum(target==label)/60;
end
