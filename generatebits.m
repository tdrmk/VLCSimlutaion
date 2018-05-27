function output = generatebits(noOfBits)
    noOfBits = 2^nextpow2(noOfBits);
    output = floor(2*rand(1,noOfBits));
end