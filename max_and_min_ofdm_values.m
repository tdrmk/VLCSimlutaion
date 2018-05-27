% This script is used to calculate  maximum and minimum values of ofdm for
% different modulation schemes, different number of sub-carriers and cyclic
% prefix
MAX = zeros(1,10);
MIN = zeros(1,10);
for i = 1:10
   in = generatebits(1000000);
   output = ofdmmod(qpskmod(in),8,1);
   MIN(i) = min(output);
   MAX(i) = max(output);
end