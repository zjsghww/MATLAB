figure; tr=40; plot(squeeze(onedata(1,:,:,tr))');
figure; s=2; stim=23; plot(squeeze(mean(onedata(s,:,:,allevents(s,:)==stim & allgoodevents(s,:)),4))');
figure; s=1; stim=23; plot(squeeze(mean(onedata(s,:,:,allevents(s,:)==stim & allgoodevents(s,:)),4))');

figure; s=2; stim=13; imagesc(onepsdf(s,:),1:128,log(squeeze(mean(onepsd(s,:,:,allevents(s,:)==stim & allgoodevents(s,:)),4))));
figure; s=1; stim=13; imagesc(onepsdf(s,:),1:128,log(squeeze(mean(onepsd(s,:,:,allevents(s,:)==stim & allgoodevents(s,:)),4))));
figure; s=1; stim=23; imagesc(onepsdf(s,:),1:128,log(squeeze(mean(onepsd(s,:,:,allevents(s,:)==stim & allgoodevents(s,:)),4))));
figure; s=2; stim=23; imagesc(onepsdf(s,:),1:128,log(squeeze(mean(onepsd(s,:,:,allevents(s,:)==stim & allgoodevents(s,:)),4))));

path([path 'C:\Users\Steffen\Documents\MATLAB\EEG_Box'];
load('C:\Users\Steffen\Documents\MATLAB\EEG_Box\chanlocs_from_Analyzer2_128Ch.mat');

figure; topoplot(double(log(squeeze(mean(mean(onepsd(s,:,1:4,allevents(s,:)==stim & allgoodevents(s,:)),3),4)))'), chanlocs);
figure; topoplot(double(squeeze(mean(mean(onedata(s,:,480:520,allevents(s,:)==stim & allgoodevents(s,:)),3),4))'), chanlocs);
