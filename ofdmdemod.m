function output = ofdmdemod (input,NC,NCP,channelresponse) 
    % channelresponse is optional parameter
    % NC: Number of carriers NCP: Cyclic Prefix
    % this function involves a simple detection scheme to take into account
    % multipath charactersitic of channel 
    
    % Set the default channel response to impulse response ... the ideal
    % one ..
    if ~exist('channelresponse','var') channelresponse = 1; end 
    
    output1 =  serial2parallel(input,2*(NC+1)+NCP);
    output2 = removecyclicprefix(output1,NCP);
    output3 = fft(output2);
    % Here is a simple detection unit X(k) = Y(k)/H(k) 
    output4 = multipathdetection(output3,channelresponse);
    output5 = removehermitiansymmetry(output4);
    output = parallel2serial(output5);
end