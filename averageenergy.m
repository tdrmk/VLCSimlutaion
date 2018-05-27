function AVERAGE_ENERGY = averageenergy(input)
    AVERAGE_ENERGY = sum(abs(input).^2)/length(input);
    % abs is used so as to normalize energy for complex bits ...
end