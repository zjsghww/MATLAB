
% [b,a]=butter(5,[15 30]/128,'bandpass');
% filteeg = filtfilt(b,a,eeg);
bpFilt = designfilt('bandpassfir','FilterOrder',20,...
    'CutoffFrequency1',15,'CutoffFrequency2',30,...
    'SampleRate',256);
normalizefreq(bpFilt,'false');
filteeg = filtfilt(bpFilt,eeg);
figure; plot(eeg); 
hold on; plot(filteeg);
figure; cwt(eeg);
hold on; cwt(filteeg);