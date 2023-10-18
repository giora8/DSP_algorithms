f0=100;
f1=300;
T=1;
phi0=0;
fs = 10e3;

x_chirp = myChirp(f0 , f1 , T , phi0 , fs);
[f0, f1] = estimateLinearChirp(x_chirp, fs);

x_n = x_chirp + 0.2*randn(size(x_chirp));
[f0_n, f1_n] = estimateLinearChirp(x_n, fs);

formatSpec = "Clean chirp: f0: %1.1f [Hz] f1: %1.1f [Hz]";
str = sprintf(formatSpec,f0,f1);
disp(str);

formatSpec = "Noisy chirp: f0: %1.1f [Hz] f1: %1.1f [Hz]";
str_n = sprintf(formatSpec,f0_n,f1_n);
disp(str_n);