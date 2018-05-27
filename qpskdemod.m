function output = qpskdemod( input )
    output = zeros(1,length(input)*2);
    for i = 1 : length(input)
        output((2*i-1):(2*i)) = qpskdemodsymbol(input(i)) ;
    end
end