%% extractPhase.m
function phi = extractPhase(r, fc, f0, fs, T)
%% Inputs
% r - modulated signal signal [1 X N_samples]
% fc - carrier frequency [Hz]
% f0 - information frequency [Hz]
% fs - sampling frequency that the signal was measured [Hz]
% T - sampling time [sec]
%% Output
% phi: estimated phase of the information signal [rad]

%----------------------generate analytic signal---------------------------%

    t = 0 : 1/fs : T-1/fs;
    z = hilbert(r);

%-----------------extract the phase of the analytic signal----------------%    
    
    inst_phase = unwrap(angle(z));
    
%--removing the carrier value from the phase to get the information part--%        
    
    phase_corrected = inst_phase - 2*pi*fc.*t;

%-----------------evaluating fft on the information signal----------------%        
    
    N = length(phase_corrected);
    Z = fft(phase_corrected);
    
    P2 = abs(Z/N);
    P1 = P2(1:N/2+1);
    P1(2:end-1) = 2*P1(2:end-1);

%-----------extract the phase of the information frequency----------------%        
    
    [~, id] = max(P1);
    theta = angle(Z);
    theta = theta(1:N/2 + 1);
    phi = theta(id);
    phi = phi + pi/2;
   
end



