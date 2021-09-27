function [ber, ser, v, Lags] = OFDM(in, n_c, FFT_len, SNR_db, clp_lvl, ryl)
num_carriers = n_c;
IFFT_len = FFT_len;

% Transmitter Modules:
out_QPSK = QPSK(in);
framed = Frame_Divider(out_QPSK', num_carriers);
out_tx_s2p = TX_Serial_to_parallel(framed, num_carriers);
dp_out = DPSK_modulation(out_tx_s2p);
out_IFFT_bins = IFFT_bins_allocation(dp_out);
out_IFFT = IFFT(out_IFFT_bins, IFFT_len);
out_CP = CP_addition(out_IFFT);
out_tx_p2s = TX_parallel_to_serial(out_CP);
[out_tx_cas, pilot] = TX_cascade_frames(out_tx_p2s,num_carriers);
out_tx_cas = clipper(out_tx_cas, clp_lvl);

if(ryl ~= 0)
    [out_tx_cas, H_f] = rayleigh(out_tx_cas); %Rayleigh
end

% AWGN Channel:
out_channel = channel(out_tx_cas, SNR_db); %AWGN

%Equalizer

if(ryl == 2)
out_channel = MMSE_Equalizer(out_channel, SNR_db, H_f); % MMSE Equalizer
end


% Receiver Modules:
[idx, v, Lags] = delay_estimation(out_channel, pilot); % for bonus part
out_rx_frdet = RX_Frames_Detection(out_channel(idx:end), num_carriers);
out_rx_s2p = RX_serial_to_parallel(out_rx_frdet);
out_CPrem = CP_Removal(out_rx_s2p);
out_FFT = FFT(out_CPrem, FFT_len);
out_ExCar = Extract_Carriers(out_FFT, num_carriers);
dp_demod_out = DPSK_Demodulation(out_ExCar);
out_rx_p2s = RX_parallel_to_serial(dp_demod_out);
out_rx_cas = RX_cascade_frames(out_rx_p2s);
out_QPSK_demod = QPSK_Demodulation(out_rx_cas);
[ber, ser] = Estimation_output(out_QPSK_demod, in, out_rx_cas, out_QPSK);



end

