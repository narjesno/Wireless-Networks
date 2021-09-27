function [out] = RX_cascade_frames(in)
shape = size(in);
out = reshape(in, shape(1)*shape(2), 1);
end

