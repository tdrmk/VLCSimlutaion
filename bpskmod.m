 function output = bpskmod( input )
    %% this function takes bit stream and returns BPSK symbols
    output = exp( 1j*2*pi*input/2 ) ;
end