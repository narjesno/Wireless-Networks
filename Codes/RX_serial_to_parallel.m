function out = RX_serial_to_parallel(in)
shape = size(in);
out = reshape(in, [],(1024*5/4), shape(2));
end

