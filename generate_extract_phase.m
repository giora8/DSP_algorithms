f0=1e3;
fc=1e6;
T=0.2;
fs=20e6;
t = 0: 1/fs : T - 1/fs;
phi = pi/2;

x_m = sin(2*pi*f0.*t + phi);
r = cos(2*pi*fc.*t + x_m);
phi_extracted = extractPhase(r, fc, f0, fs, T);

formatSpec = "Input phase: %1.3f [rad] Estimated phase: %1.3f [rad]";
str = sprintf(formatSpec,phi,phi_extracted);
disp(str);
