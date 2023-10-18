f0 = 1015; % [Hz]
fs = 10e3;  % [Hz]
T  = 100e-3;  % [s]

N_iter = 10000;

est_f0 = zeros(1, N_iter);
for ii = 1 : N_iter

    x = myHarmFunc(f0,fs,T);
    cur_f0 = EstimateBaseFreq(x, fs);
    est_f0(ii) = cur_f0;
    
end

figure(); histogram(est_f0, 'Normalization','probability');
xlabel('Estimated frequency [Hz]');
ylabel('Probability');
