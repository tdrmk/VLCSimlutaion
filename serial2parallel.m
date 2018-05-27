function output = serial2parallel(input,noOfStreams)
    % This function assumes that length of input is a multiple of
    % noOfStreams
    output = reshape(input,noOfStreams,(length(input)/noOfStreams));
end