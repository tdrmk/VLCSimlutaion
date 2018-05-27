function output = quantize(input,Amin,Amax,numBits)
    % Assuming an serialized input stream 
    output = zeros(1,length(input));
    for i = 1:length(input)
        output(i) = quantizesymbol( input(i), Amin, Amax, numBits);
    end
end