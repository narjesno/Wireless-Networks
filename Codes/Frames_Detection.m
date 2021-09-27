function [out, num_frames] = Frames_Detection(in, n_c)
sfc = ceil(2^13/n_c);
frame_len = (1024 * (sfc+1));
header_len = 8 * frame_len;
out  = in(header_len+1:len(in)- header_len); % throwing the header away
num_frames = (len(in) - 2* header_len)/(frame_len*(5/4)); % number of frames we expect
end


