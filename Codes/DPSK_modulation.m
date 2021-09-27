function [out] = DPSK_modulation(in)
shape = size(in);
random_first_row = randi([0 3], shape(2), shape(3));
extended_in_signal = zeros(shape(1)+1,shape(2),shape(3));
extended_in_signal(1,:,:) = random_first_row;
extended_in_signal(2:(shape(1)+1),:,:) = in;
out = zeros(shape(1)+1,shape(2),shape(3));
for row = 2:(shape(1)+1)
    out(row,:,:) = mod(extended_in_signal(row,:,:)+extended_in_signal(row-1,:,:),4);
end
% outSignal((2:(shape(1)+1)),:,:) = mod(extended_in_signal((2:(shape(1)+1)),:,:)+extended_in_signal((1:shape(1)),:,:),4);
out(1,:,:) = extended_in_signal(1,:,:);
out = changem(out, [1 -1 j -j], [0 2 1 3]);
end

