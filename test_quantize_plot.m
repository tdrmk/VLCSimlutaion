%% This script is to test quantization functions and plots them
Fs = 1000 ;% Sampling Frequency 
T = 1 ; %Time Duration
t = 0:1/Fs:T ; % samples
f = 1 ; % Frequency of test sinusoid
input = sin(2*pi*f*t);
numbits = 8 ;
output = quantize(input,min(input),max(input),numbits);
subplot(3,1,1),plot(t,input);
subplot(3,1,2),plot(t,output);

subplot(3,1,3),plot(t,input),hold on ;
subplot(3,1,3),plot(t,output), hold off;