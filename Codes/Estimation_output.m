function [ber, ser] = Estimation_output(predicted_bit, labels, predicted_symbols, symbols)
shape = size(labels);
ber = sum(sum(predicted_bit(1:shape(1),:) ~= labels))/(shape(1)*shape(2));
ser = sum(predicted_symbols(1:shape(1)) ~= symbols)/shape(1);
end

