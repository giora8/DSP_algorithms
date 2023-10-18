function x = myChirp(f0 , f1 , T , phi0 , fs)

% phi0 = 0.15*pi;
% fs = 10e3;
% f0 = 100;
% f1 = 300;
% T = 1;
alpha = (f1-f0)/(2*T);
t=0:1/fs:T-1/fs;
x = sin((2*pi*alpha*t + 2*pi*f0).*t + phi0);

end
