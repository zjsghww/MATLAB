cd /data
load CLAS_VP04_onedata_STBFH_MNT.mat

global data EEG

figure;plot(1:4000,squeeze(onedata(1,80,:,40)))

% data = squeeze(onedata(1,:,:,:));
% EGB_fftfilter(0.5,100,'bandp');
% onedataf(1,:,:,:) = data;
% 
% data = squeeze(onedata(2,:,:,:));
% EGB_fftfilter(0.5,100,'bandp');
% onedataf(2,:,:,:) = data;
% 

% onedatad = onedata(:,:,1:5:4000,:);

figure; semilogy(onepsdf(onepsdf<30), squeeze(mean(mean(mean(onepsd(:,:,onepsdf<30,:),1),2),4)));

data = squeeze(onedata(1,:,:,:));
EGB_fftfilter(4,7,'bandp');
onedatatheta(1,:,:,:) = data;
data = squeeze(onedata(2,:,:,:));
EGB_fftfilter(4,7,'bandp');
onedatatheta(2,:,:,:) = data;

figure; plot(squeeze(onedata(1,20,:,35)));
hold on; plot(squeeze(onedatatheta(1,20,:,35)),'r');

onedatathetadiff = diff(onedatatheta,1,3);
hold on; plot(squeeze(onedatathetadiff(1,20,:,35))*10,'c');

thetaons = NaN(2,128,32,80);
thetaamp = NaN(2,128,32,80);
for i=1:2
    for j=1:128
        for k=1:80
            [a,o] = findpeaks(double(squeeze(onedatathetadiff(i,j,:,k))));
            thetaamp(i,j,1:length(a),k) = a;
            thetaons(i,j,1:length(o),k) = o;
        end
    end
end

thetalen = diff(thetaons,1,3);

for i=1:2
    for j=1:128
        for k=31
            for l=1:80
                if thetalen(i,j,k,l)<125
                    thetaons(i,j,k,l)=NaN;
                end
                if thetalen(i,j,k,l)>200
                    thetaons(i,j,k,l)=NaN;
                end
            end
        end
    end
end

im = zeros(2,128,4000,80);
for i=1:2
    for j=1:128
        for k=1:31
            for l=1:80
                if ~isnan(thetaons(i,j,k,l))
                    im(i,j,thetaons(i,j,k,l),l) = 1;
                end
            end
        end
    end
end
imagesc(squeeze(im(1,:,:,22)));
colorlmap(gray);

sumim = sum(im,2);

thetaonssum = sum(thetaons,2);
bar(squeeze(sumim(1,1,:,22)));
