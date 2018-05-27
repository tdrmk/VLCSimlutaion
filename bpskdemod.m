function output = bpskdemod( input )
    output = zeros(1,length(input));
    for i = 1 : length(input)
        output(i) = bpskdemodsymbol(input(i)) ;
    end
end