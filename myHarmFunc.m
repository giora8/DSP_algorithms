function x = myHarmFunc(f0,fs,T)
t = 0:1/fs:T-1/fs;
x = cos(2*pi*f0*t) + 0.5*randn(size(t));
end
