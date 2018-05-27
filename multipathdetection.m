function output = multipathdetection(input,channelresponse)
    % Use this block after FFT in OFDM detection unit ...
    % Use different OFDM detection models ...
    % A simplistic on is used Y(k)/H(k) + N(k) = X(k)
    % Assuming Input is parallel streams whose fft already taken ...
    NPC = size(input,1); % Number of parallel streams
    ChannelResponse = fft(channelresponse,NPC); % this contains the frequency response of channel
    H1 = reshape(ChannelResponse,length(ChannelResponse),1); % taking its transpose
    H = repmat(H1,1,size(input,2));
    output = input./H ;
end