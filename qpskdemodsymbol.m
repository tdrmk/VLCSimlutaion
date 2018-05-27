function outputsymbol = qpskdemodsymbol(inputsymbol)
     if ( abs(real(inputsymbol)) >= abs(imag(inputsymbol)) )  % |Re(z)| > |Im(z)| -> symbol 0 or 2
        if (real(inputsymbol) >= 0 )  % Then symbol is 0
            outputsymbol = [ 0 0 ];
        else % Then symbol is 2
            outputsymbol = [ 1 0 ] ;
        end
    else  % |Re(z)| < |Im(z)| -> symbol 1 or 3
        if (imag(inputsymbol) > 0 ) % Then symbol is 1
            outputsymbol = [ 0 1 ];
        else  % Then symbol is 3
            outputsymbol = [ 1 1 ];        
        end
    end
end