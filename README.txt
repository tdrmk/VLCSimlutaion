NOTE: This file Keeps track of the progress of the project ...
qpskmod : Takes bits stream and produces symbols from QPSK constellation
qpskdemodsymbol : Takes a QPSK symbol and determines the bits using maximum likelyhood detection
qpskdemod : Demodulates QPSK stream using qpskdemodsymbol and produces bit stream 
SEP : Calculates the symbol error probability given two binary strings 
serial2parallel : this function converts a given serial stream into parallel with given numer of streams
parallel2serial : this function combines all parallel streams into a single serial stream  
fft and ifft : using in-build functions
addcyclicprefix : this function adds a cyclic prefix of given size
removecyclicprefix : this function removes a cyclic prefix of given size
addhermitiansymmetry : this function add hermitian symmetry columnwise
removehermitiansymmetry : inverts the previous operation
addawgnnoise : this function add agwn noise to real and complex streams ...
amplify : this function amplifies signal by given amount
attinuate : this function attinuates the signal by given amount
ofdmmod : Takes input symbols and generates output symbols NOTE WARNING ::: ADDED RECENTLY normalizeenergy
ofdmdemod : Takes ofdm symbols and demodulates them (Note this function also takes multipath characteristics into account )
 this function does uses a detection scheme ( Modify it later )...
multipathdetection: this function detects input symbols in multipath channel modeled using multitap digital filter 
generatebits: this function generates random bit stream in the next nearest power of 2 bits....
bpskmod bpskdemod bpskdemodsymbol : For BPSK
quantizesymbol : Quantizes a symbol based on input, Amin, Amax, NumberOfBits used to represent it
quantize : This quantizes an input stream ...
signallevelrations : this function returns normalized signal level at destination an relay for different paths for given led configuration 
delaysignal : delays the input signal by given amount
normalizeenergy : This function normalizes energy of input symbols in a stream ie makes average energy per-symbol to unity 
averageenergy : calculates average energy of signal 