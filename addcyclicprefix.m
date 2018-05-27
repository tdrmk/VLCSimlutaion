function output = addcyclicprefix(input, NCP)
    % This function add 'NCP' streams from end of input to the start
    output = [input(end-NCP+1:end,:); input]; 
end