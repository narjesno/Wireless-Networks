function [out] = DPSK_Demodulation(in)
Re_in_signal = real(in);
Im_in_signal = imag(in);
shape = size(in);
dist = zeros(shape(1), shape(2), shape(3), 4);
dist(:,:,:,1) = (Re_in_signal-1).^2 + Im_in_signal.^2;
dist(:,:,:,2) = (Re_in_signal).^2 + (Im_in_signal-1).^2;
dist(:,:,:,3) = (Re_in_signal+1).^2 + Im_in_signal.^2;
dist(:,:,:,4) = (Re_in_signal).^2 + (Im_in_signal+1).^2;
[~, detected] = min(dist, [], 4);
detected=detected - 1;
for row = 2:shape(1)
    detected(row,:,:) = mod(detected((row),:,:)-detected((row-1),:,:), 4);
end
out = detected((2:shape(1)),:,:);
end

