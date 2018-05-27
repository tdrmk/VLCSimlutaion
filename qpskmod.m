function output = qpskmod( input )
    %% this function takes bit stream and returns QPSK symbols
    if mod(length(input),2) == 1 % odd length input
        input = [input;0]; 
    end
    symbols = [2 1] * reshape(input,2,length(input)/2);
    output = exp( 1j*2*pi*symbols/4 ) ;
end