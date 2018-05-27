%% Get power levels .... Normalized with respect to received power at destination Photo Diode
[Psd,Psr,Prd] = signallevelratios(100,5) ; % Normalized power levels for given LED configuration ( source and relay )
%% Monta Carlo Simulations of DECODE and FORWARD RELAY model with OFDM with QPSK under AWGN Noise without processing delay considerations
SNR = 1:2:16 ;
sep = zeros(size(SNR));
for n = 1:length(SNR)
    %% AT SOURCE 
    bitstream = generatebits(1e6); % input bit stream generated at source
    symbolstream1 = qpskmod(bitstream); % QPSK symbol stream generated at source
    symbolstreams = ofdmmod(symbolstream1,4,1); % OFDM Symbol Stream with NC=4 and NCP=1 generated at source

    %% AT CHANNEL BEFORE RELAY
    signalr = amplify(symbolstreams,sqrt(Psr)*db2mag(SNR(n))); % Amplified signal at relay 
    rcvsignalr = addawgnnoise(signalr); % Received signal at relay
    
    %% AT RELAY
    rcvsymbolstreamr = ofdmdemod(rcvsignalr,4,1); % OFDM Symbol Stream demodulation at relay
    rcvbitstreamr = qpskdemod(rcvsymbolstreamr); % QPSK Demodulation demodulation at relay
    gensymbolstream = qpskmod(rcvbitstreamr); % QPSK symbol stream generated at source
    symbolstreamr = ofdmmod(gensymbolstream,4,1); % OFDM Symbol Stream with NC=4 and NCP=1 generated at source
    
    %% AT CHANNEL BEFORE DESTINATION
    signalds = amplify(symbolstreams,sqrt(Psd)*db2mag(SNR(n))); % Amplified signal from source at destination
    signaldr = amplify(symbolstreamr,sqrt(Prd)*db2mag(SNR(n))); % Amplified signal from relay at destination
    rcvsignalds = addawgnnoise(signalds); % Add normalized awgn noise to signal from source
    rcvsignaldr = addawgnnoise(signaldr); % Add normalized awgn noise to signal from relay
    % Add delay later also model channel accordingly ..
    
    %% AT RECEIVER 
    rcvsignal = rcvsignalds + rcvsignaldr ;
    rcvbitstream1 = ofdmdemod(rcvsignal,4,1); % OFDM Symbol Stream demodulation
    rcvbitstream = qpskdemod(rcvbitstream1); % QPSK Demodulation
    sep(n) = SEP(rcvbitstream,bitstream); % Find Bit Error Probability
    
end
sepdf = sep ;
%figure,semilogy(SNR,sep,'*'),title('Monta Carlo Simulations of BEP of OFDM-QPSK with decode and forward relay without processing delay considerations'),xlabel('SNR(dB)'),ylabel('BEP');

