[eeg,label] = extractdata(dirs{6});
Fs = 256; 
% for k=1:60
for j=1:4
subplot(2,2,j);
axis([0 9 -inf  inf])
for i=0:1:9
    sig = eeg(j,(1+Fs*i):(Fs+Fs*i),30);   %ѡȡ��һ��������2��trial��������ʱƵ����
    sig = sig*70e3;
    %---------����Ҷ�任------------
    N = length(sig);  %��������� 
    n = 0:N-1;
    t = n/Fs; %ʱ������
    Y = fft(sig, N);
    mag_temp = abs(Y);  %���Fourier�任������, ʱ�䴰�ڵ�Ƶ������
    image((i+5):(i+7), 5:20, mag_temp(1:N/4)')
    hold on;
end
xlabel('Time / s');
ylabel('Frequency / Hz');
hold on;
end
% h=figure(k);
% saveas(h,strcat(num2str(k),'th trial'),'jpg');
% end
% % sig = eeg(1,:,2);  
% sig = sig*10e3;
% %---------����Ҷ�任------------
% N = length(sig);  %��������� 2560
% Fs = 256;   
% n = 0:N-1;
% t = n/Fs; %ʱ������
% Y = fft(sig, N);
% mag = abs(Y);  %���Fourier�任������
% f = n*Fs/N;  %Ƶ������
% plot(f(1:N/2),mag(1:N/2))  % ������ӦƵ�ʵķ�ֵ
% time = 4:0.5:7;
% image(time, 5:25,mag(1:N/4)')
% xlabel('ʱ�� / s');
% ylabel('Ƶ�� / Hz');
% colorbar;




% s = 10;
% e = eeg*10e6;
% data = e(:,:,[3,1,6,2]);
% test = data(1,1:256*s ,:);  %4����ͬƵ�ʵ�trial����һ��������ǰ4s������
% z = reshape(test,4,256*s); %4*1024
% zz = zeros(4,1);
% for i=0:0.5:s-1
%    temp = mean(z(:,(1+256*i):(256+256*i)),2); 
%    zz = cat(2,zz,temp);
% end
% zz = zz(:,2:end);
% z = zz*100;
% image(1:s,6:1:9,z);
% title('SSVEP ��1������');
% xlabel('s');
% ylabel('Hz');
% colorbar;

