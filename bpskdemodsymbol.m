function outputsymbol = bpskdemodsymbol(inputsymbol)
    if (real(inputsymbol)>= 0)  % Re(z) > 0 -> symbol 0 
        outputsymbol = 0 ;
    else  % Re(z) < 0 -> symbol 1 
        outputsymbol = 1 ;
    end
end