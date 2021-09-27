function [out] = Extract_Carriers(in, n_c)
out = in(:,76:76+n_c-1,:);
end