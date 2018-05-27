%% Monta Carlo Simulations of QPSK under AWGN Noise
SNR = 1:10 ;
sep = zeros(size(SNR));
for n = 1:length(SNR)
    bitstream = generatebits(1e6); % input bit stream
    symbolstream = qpskmod(bitstream); % QPSK symbol stream
    signal = amplify(symbolstream,db2mag(SNR(n))); % Amplified signal
    rcvsignal = addawgnnoise(signal); % Add normalized awgn noise
    rcvbitstream = qpskdemod(rcvsignal);
    sep(n) = SEP(rcvbitstream,bitstream);
end
figure,semilogy(SNR,sep,'*'),title('Monta Carlo Simulations of BEP of QPSK'),xlabel('SNR(dB)'),ylabel('SEP');
k = qfunc(db2mag(SNR));
SEP1 = 2.*k - k.^2;
hold on,semilogy(SNR,SEP1); % There is difference in values because here we are ploting bit error in first case and symbol error in second case
% Bit Error wil sure be lower