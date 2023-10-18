%% EstimateBaseFreq.m
function fo = EstimateBaseFreq(x, fs)
%% Inputs
% x - harmonix signal [1 X N_samples]
% fs - sampling frequency that the signal was measured [Hz]
%% Output
% fo: estimated base frequency of the harmonic signal [Hz]

%--------------------------evaluating fft---------------------------------%

    Z = fft(x);
    
%----------normalizing and extracting half of the powerst-----------------%
    
    N = length(x);
    P2 = abs(Z/N);
    P1 = P2(1:N/2+1);
    P1(2:end-1) = 2*P1(2:end-1);

%---------------------creating frequency axis-----------------------------%
    
    f = fs*(0:(N/2))/N;
    
%-----------estimating base frequency using maximal value-----------------%

    [~, max_id] = max(P1);
    fo = f(max_id);

end

