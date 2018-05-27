function output = ofdmmod(input,NC,NCP)
    % This function generates ofdm symbols with NC subcarries and NCP
    % cyclic prefix
    output1 = serial2parallel(input,NC);
    output2 = addhermitiansymmetry(output1);
    output3 = ifft(output2);
    output4 = addcyclicprefix(output3,NCP);
    %output = parallel2serial(output4);
    
    %% ADDED LATELY remove if not need
    output5 = parallel2serial(output4);
    output = normalizeenergy(output5);
end