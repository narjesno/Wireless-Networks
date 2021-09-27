function [out] = channel(in, SNR)
out = awgn(in, SNR);
end

