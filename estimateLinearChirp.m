%% estimateLinearChirp.m
function [f0, f1] = estimateLinearChirp(x, fs)
%% Inputs
% x - chirp signal [1 X N_samples]
% fs - sampling frequency that the signal was measured [Hz]
%% Output
% f0: estimated initial frequency of the chirp signal [Hz]
% f1: estimated end frequency of the chirp signal [Hz]

%-------------------------evaluating stft---------------------------------%

    FRAME_SIZE = 512;
    WINDOW_SIZE = 512;
    
    [S,F,~] = stft(x, fs, 'Window', hann(WINDOW_SIZE, 'periodic'), 'OverlapLength', FRAME_SIZE/2, 'FFTLength',FRAME_SIZE);

%-------------extracting half of the frequency & power axis---------------%

    N_freq = length(F);
    F_cut = F(N_freq/2:end);
    S_cut = S(N_freq/2:end, :);

%------estimating initial and end frequency using maximal values----------%    

    S0 = S_cut(:, 1);
    S1 = S_cut(:, end);
    
    [~, id0] = max(abs(S0));
    [~, id1] = max(abs(S1));
    
    f0 = F_cut(id0);
    f1 = F_cut(id1);
    

end



