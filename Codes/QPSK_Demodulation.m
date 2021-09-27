function [predicted_bit, predicted_symbol] = QPSK_Demodulation(in)
predicted_symbol = changem(in, [0 1 2 3], [0 1 3 2]);%Gray coding
predicted_bit = de2bi(predicted_symbol);
end

