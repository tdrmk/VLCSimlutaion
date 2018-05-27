function  output = delaysignal(input,delaybysamples)
    % Assuming serial input stream is given 
    % This function is used to simulate processing delay ...
    % This function delays the input symbol stream by given
    % 'delaybysamples' and truncates remaining elements and add zeros at begining
    % Delay Samples = Tp/Ts where Tp is processing delay and  
    % Ts is sampling delay
    output1 = [ zeros(1,delaybysamples) input] ;
    output = output1(1:end-delaybysamples) ;
end