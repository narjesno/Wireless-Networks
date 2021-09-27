function [out] = TX_Serial_to_parallel(in, n_c)
sfc = ceil(2^13/n_c);
no_frames = size(in);
no_frames = no_frames(2);
out = reshape(in, sfc, n_c, no_frames);
end

