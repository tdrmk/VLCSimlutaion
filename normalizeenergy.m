function output = normalizeenergy(input)
    % This function returns an scaled version of input stream whose energy is normalized to unity 
    AVERAGE_ENERGY = averageenergy(input);
    output = input / sqrt(AVERAGE_ENERGY) ;
end