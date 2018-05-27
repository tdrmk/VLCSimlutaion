function sep = SEP(input1,input2) 
% Note this function can also be used to calculate BEP
% This function assumes that inputs of same length
    sep = sum(input1 ~= input2)/length(input1);
end