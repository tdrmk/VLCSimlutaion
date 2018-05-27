function output = addawgnnoise(input)
    % this function adds normalized awgn noise ie Noise Power is unity
    if isreal(input) % if real valued signal
        output = input + randn( size(input,1), size(input,2));
    else % complex valued signal
        output = input + ( randn(size(input,1),size(input,2)) + 1j*randn(size(input,1),size(input,2)) )/sqrt(2) ;
    end
end