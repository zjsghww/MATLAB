% ICA_1.m算出了第五位受试在6,7,8,9Hz频率下的ICA分量
% 现在将4个分量的频谱能量图画出来，挑选signal ICs 和 noise ICs, 用CCA分析

    
[eeg, label] = extractdata(dirs{8});
accur = zeros(4,1);

% 把每种频率的15个trial拼在一起，为4*38400
for i=1:4
trials = find(label == i);
data = eeg(:,:,trials);
data = reshape(data, 4, 38400);

% % temporal wave
% plot(data(1,1:256*10));
% axis([0 2560  -inf inf]);
% % set(gca, 'xtick',[1,10]);
% set(gca, 'xticklabel', {'1','2','3','4','5','6','7','8','9','10'});
% xlabel('(s)');
% ylabel('V');

data_ = data*10e6;
[icasig, A, W] =  fastica(data_);

% % amptitude wave
% [ps,f] = PSD(icasig,256,10,2,[1 40]);
% plot(f, ps)

% location = zeros(60,1);

h = figure;
[ps,f] = PSD(icasig,256,10,1,[5 10]);
plot(f, ps,'b','marker','o','linewidth',2)
hold on;
[ps,f] = PSD(icasig,256,10,2,[5 10]);
plot(f, ps,'r','marker','*','linewidth',2)
hold on;
[ps,f] = PSD(icasig,256,10,3,[5 10]);
plot(f, ps,'g','marker','+','linewidth',2)
hold on;
[ps,f] = PSD(icasig,256,10,4,[5 10]);
plot(f, ps,'cyan','marker','^','linewidth',2)
legend('IC1','IC2','IC3','IC4');
xlabel('Frequency(Hz)');
ylabel('Relative Power');
name = strcat('PSD of SSVEP ICs for 8th subject gazing at ', num2str(i+5) ,'Hz');
saveas(h, name, 'jpg');

d = reshape(icasig,4,2560,15);

[~,target] = ccabycl(d(1:3,:,:),[6,7,8,9],256);
accur(i) = sum(target==i)/15;
end