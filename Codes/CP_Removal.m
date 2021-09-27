function [out] = CP_Removal(in)
shape = size(in);
out = in(:,(shape(2)/5+1):shape(2),:);
end



