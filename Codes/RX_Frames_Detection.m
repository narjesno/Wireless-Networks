function out = RX_Frames_Detection(in, n_c)
sfc = ceil(2^13/n_c);
frame_len = (1024 * (sfc+1));
header_len = 8 * frame_len;
in  = in(header_len+1:length(in)- header_len); % throwing the header away
% num_frames = (length(inSignal))/(frame_len*(5/4)); % number of frames we expect
out = reshape(in, frame_len*(5/4), []); % separating frames by rows 
end


