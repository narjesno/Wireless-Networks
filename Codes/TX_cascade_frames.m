function [out, header_f] = TX_cascade_frames(in, n_c)
shape = size(in);
sfc = ceil(2^13/n_c);
out = reshape(in, 1, shape(1)*shape(2));
header_f = randi([0 1], 1, 8*1024*(sfc+1)); % for the bonus part
out = cat(2, header_f, out);
out = cat(2, out, header_f);
delay = randi([1 8*1024*(sfc+1)]); % for the bonus part
out = cat(2, randi([0 1], 1, delay), out);
end

