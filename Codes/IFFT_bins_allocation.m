function [out] = IFFT_bins_allocation(in)
conj_in_signal = conj(in);
shape = size(in);
out = zeros(shape(1), 1024, shape(3));
out(:,(76:76+shape(2)-1),:) = in;
out(:,(550:550+shape(2)-1),:) = conj_in_signal;
end

