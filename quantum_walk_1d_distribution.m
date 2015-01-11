
%QUANTUM_WALK_1D_DISTRIBUTION Calculates the probability distribution of
%                   continuous-time quantum walks on a line.
%
%  QUANTUM_WALK_1D_DISTRIBUTION(n, t) Calculates the probability distribution 
%                   of continuous-time quantum walks on a line.
%       n:          the range of the line is [-n, +n].
%       t:          the time t, which is a real.
%       return:     a (2*n+1)-dimension vector representing the probability 
%                   for the walker at each position at the time t.

%   Copyright 2014, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function D_t = quantum_walk_1d_distribution(n, t)
    D_t = zeros(2*n+1);
    for x = -n : n       
        % $\braket{x}{\psi(t)}=\frac{1}{2\pi}\int_{-\pi}^{\pi}\dif{k}\eu^{2\iu\cos(k)t+\iu kx}$
        p_x = 1/(2*pi)*integral(@(k) exp(2*1i*cos(k)*t+1i*k*x), -pi, pi);        
        D_t(x+n+1) = abs(p_x)^2;
    end
end