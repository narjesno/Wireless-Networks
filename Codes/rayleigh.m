function [out, H_f] = rayleigh(in)
len = length(in);
ray_smpl = raylrnd(1, 1, len);
H_f = ray_smpl;
out = ray_smpl.*in;
end

