%% Monta Carlo Simulations of OFDM with QPSK under AWGN Noise
SNR = 1:20 ;
sep = zeros(size(SNR));
for n = 1:length(SNR)
    bitstream = generatebits(1e6); % input bit stream
    symbolstream1 = qpskmod(bitstream); % QPSK symbol stream
    symbolstream2 = ofdmmod(symbolstream1,4,1); % OFDM Symbol Stream with NC=4 and NCP=1 
    symbolstream = quantize(symbolstream2,min(symbolstream2),max(symbolstream2),8); % Quantization of OFDM symbol stream with 8-bits
    signal = amplify(symbolstream,db2mag(SNR(n))); % Amplified signal
    rcvsignal = addawgnnoise(signal); % Add normalized awgn noise 
    rcvsymbolstream = quantize(rcvsignal,min(rcvsignal),max(rcvsignal),8); % Quantize the received OFDM symbol stream with 8-bits
    rcvsymbolstream1 = ofdmdemod(rcvsymbolstream,4,1); % OFDM Symbol Stream demodulation
    rcvbitstream = qpskdemod(rcvsymbolstream1); % QPSK Demodulation
    sep(n) = SEP(rcvbitstream,bitstream); % Find Symbol Error Probability
end
figure,semilogy(SNR,sep,'*'),title('Monta Carlo Simulations of BEP of OFDM-QPSK with quantization'),xlabel('SNR(dB)'),ylabel('SEP');