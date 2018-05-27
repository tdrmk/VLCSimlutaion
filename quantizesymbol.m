function outputsymbol = quantizesymbol( inputsymbol, Amin, Amax, numBits)
    % this function quantizes input symbol and returns the quantized symbol
    % which is based on Amin, Amax and number of bits used to represent it
    L = 2^numBits ; % Number of levels on quantization
    delta = (Amax - Amin)/L ; % Step Size
    for l = 1:L
        if ( Amin + l * delta >= inputsymbol)
            outputsymbol = Amin + ( l -1/2 )* delta ; % Quantized value
            return ;
        end
        if l == L
            outputsymbol = Amin + (L -1/2) * delta ; % Maximum Level 
        end
    end
end