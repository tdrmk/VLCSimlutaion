function output = parallel2serial(input)
    output = reshape(input,1,size(input,1)*size(input,2));
end