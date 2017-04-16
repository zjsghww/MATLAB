
function [amp,angl] = get_emd_f(eegdata)
    Ts = 1/256;
     [~,~,epoch] = size(eegdata);
%     [~,epoch] = size(data);
    data = squeeze(mean(eegdata,1));  % mean of all channels
    angl = zeros(epoch,3);
    amp = zeros(epoch,3);
    for j=1:epoch
        imfs = emd(data(:,j));
        for i=1:3
            ht = hilbert(imfs{i});  % Hilbert Transform result
            eng = sqrt(real(ht).^2+imag(ht).^2);  % instantaneous amplitude
            amp(j,i) = mean(eng);  % mean of series of amplitudes
            th = angle(ht);   % theta angle
            omega = diff(th)/Ts;  % instantaneous frequency rad/s
    %         subplot(3,1,i);
    %         plot(amp(i,:));        
            angl(j,i) = std(omega); % standard deriviation of series of frequencies
        end     
    end
    
    % csp_f=get_f(eegdata,eeglabel);

