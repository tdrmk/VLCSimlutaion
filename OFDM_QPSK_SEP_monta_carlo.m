%% Monta Carlo Simulations of OFDM with QPSK under AWGN Noise without relay
SNR = 1:2:16 ;
sep = zeros(size(SNR));
for n = 1:length(SNR)
    bitstream = generatebits(1e6); % input bit stream
    symbolstream1 = qpskmod(bitstream); % QPSK symbol stream
    symbolstream = ofdmmod(symbolstream1,4,1); % OFDM Symbol Stream with NC=4 and NCP=1 
    signal = amplify(symbolstream,db2mag(SNR(n))); % Amplified signal
    rcvsignal = addawgnnoise(signal); % Add normalized awgn noise
    rcvbitstream1 = ofdmdemod(rcvsignal,4,1); % OFDM Symbol Stream demodulation
    rcvbitstream = qpskdemod(rcvbitstream1); % QPSK Demodulation
    sep(n) = SEP(rcvbitstream,bitstream); % Find Symbol Error Probability
end
%figure,semilogy(SNR,sep,'*'),title('Monta Carlo Simulations of SEP of OFDM-QPSK'),xlabel('SNR(dB)'),ylabel('SEP');
sepnr = sep; 