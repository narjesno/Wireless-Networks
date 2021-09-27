function [out] = RX_parallel_to_serial(in)
shape = size(in);
out = reshape(in, shape(1)*shape(2), shape(3));
end

