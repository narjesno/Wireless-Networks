function [out] = CP_addition(in)
shape = size(in);
out = zeros(shape(1), 1280, shape(3));
out(:, (257:1280), :) = in;
out(:, (1:256), :) = in(:, (769:1024), :);
end

