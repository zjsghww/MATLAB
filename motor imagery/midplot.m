% 
% Fs=256; L=512;
% Y=fft(subimf(1,:));
% P2=abs(Y/L);
% P1=P2(1:L/2+1);
% P1(2:end-1)=2*P1(2:end-1);
% f = Fs*(0:(L/2))/L;
% plot(f,P1)

% imf = cell(60,1);
% for i=1:60
%     i
%     imf{i} = memd(eegdata(:,:,i));
% end
% 
% eegnew = zeros(11,512,60);
% for i=1:60
%    oneimf = imf{i};
%    eegnew(:,:,i) = squeeze(oneimf(:,3,:)+oneimf(:,2,:));
% end
% [a,accu,sd] = cv(eegdata,eeglabel);
% 
imfpertrial = imf{6};
imfpertrial = imfpertrial * 10e6;
[cha,k,~] = size(imfpertrial);
% 
for j=4:8
    figure;
    imfs = squeeze(imfpertrial(j,:,:));
    for i=1:k-1
        subplot(k,1,i);
        plot(imfs(i,:),'k','LineWidth',1)
        xlim([0 513])
        set(gca,'Xtick',0:128:512)
        set(gca,'XtickLabel',[])
    end 
    subplot(k,1,k);
    plot(imfs(k,:),'k','LineWidth',1)
    xlim([0 513])
    set(gca,'Xtick',0:128:512)
    set(gca,'XtickLabel',{'0','0.5','1','1.5','2'}) 
    xlabel('Time (s)','fontsize',16)
    ylabel('Amplitude (V)','fontsize', 16)
end

% for j=4:8
%     subimf=squeeze(imfpertrial(j,:,:));
%     figure;
%     for i=1:k
%         p=pwelch(subimf(i,:));
%         plot(p,'LineWidth',2);hold on;
%     end
%     set(gca, 'fontsize', 20)
%     legend('IMF1','IMF2','IMF3','IMF4','IMF5')
%     xlim([0 100])
%     ylim([0 2e-10])
%     xlabel('Frequency (Hz)','fontsize',20)
%     ylabel('Magnitude (dB)','fontsize',20)
% end

% D1=eegdata(:,:,find(eeglabel==1));
% D2=eegdata(:,:,find(eeglabel==2));
% W = csp(D1,D2);
% D1new=eegnew(:,:,find(eeglabel==1));
% D2new=eegnew(:,:,find(eeglabel==2));
% Wnew = csp(D1new,D2new);
% figure; topoplot(W(:,1),chanlocs);colormap('jet')
% figure; topoplot(W(:,11),chanlocs);colormap('jet')
% figure; topoplot(Wnew(:,1),chanlocs);colormap('jet')
% figure; topoplot(Wnew(:,11),chanlocs);colormap('jet')