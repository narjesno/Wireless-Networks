function [out] = clipper(in,clipping_db)
clipping = 10^(clipping_db/10);
max_value = max(abs(in));
in(abs(in)>max_value/clipping)= max_value/clipping;
out = in;
end

