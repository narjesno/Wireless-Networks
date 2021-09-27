function [out, W] = MMSE_Equalizer(sig, SNR_db, H_f)
SNR = 10^(SNR_db/10);
W = conj(H_f)./(abs(H_f).^2+1./(length(sig)*SNR));
out = sig.*W;
end

