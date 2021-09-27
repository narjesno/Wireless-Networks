function [output] = Frame_Divider(input, nc)
sfc = ceil(2^13/nc);
sf = sfc*nc;
reminder = sf - mod(length(input), sf);
extended_signal = cat(2, input, zeros(1, reminder));
output = reshape(extended_signal, sf, length(extended_signal)/sf); 
end

