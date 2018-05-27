%% Monta Carlo Simulations of BPSK under AWGN Noise
SNR = 1:10 ;
sep = zeros(size(SNR));
for n = 1:length(SNR)
    bitstream = generatebits(1e6); % input bit stream
    symbolstream = bpskmod(bitstream); % BPSK symbol stream
    signal = amplify(symbolstream,db2mag(SNR(n))); % Amplified signal
    rcvsignal = addawgnnoise(signal); % Add normalized awgn noise
    rcvbitstream = bpskdemod(rcvsignal);
    sep(n) = SEP(rcvbitstream,bitstream);
end
figure,semilogy(SNR,sep,'*'),title('Monta Carlo Simulations of SEP of BPSK'),xlabel('SNR(dB)'),ylabel('SEP');
SEP1 = qfunc(sqrt(2)*db2mag(SNR));
hold on,semilogy(SNR,SEP1); % Plot the analytic equation as well