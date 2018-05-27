function output = removehermitiansymmetry(input)
    numrows = size(input,1);
    numdata = numrows/2 - 1;
    output = input(2:(numdata+1),:) ;
end