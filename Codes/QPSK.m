function [s]=QPSK(d)
s = bi2de(d,2);
s = changem(s, [0 1 3 2], [0 1 2 3]);%Gray coding
end
