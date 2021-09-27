function [idx, v, Lags] = delay_estimation(in, pilot)
len = length(pilot);
[corr_hdr_rx,Lags]=xcorr(in(1:3*len),pilot);
v = corr_hdr_rx;
corr_hdr_rx=corr_hdr_rx(Lags>=0);
idx=find(corr_hdr_rx==max(corr_hdr_rx));
end

