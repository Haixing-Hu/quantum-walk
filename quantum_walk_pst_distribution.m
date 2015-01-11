
%QUANTUM_WALK_PST_DISTRIBUTION Calculates the probability distribution of
%                   continuous-time quantum walks on a weighted line segment 
%                   which is a periodical graph.
%
%  QUANTUM_WALK_PST_DISTRIBUTION(x, n, t) Calculates the probability distribution 
%                   of continuous-time quantum walks on a weighted line segment 
%                   which is a periodical graph.
%       x:          the label of the starting vector of the quantum walk.
%                   Vertexes are labelled from 1 to n.
%       n:          the number of vertexes in the line segments.
%       t:          the time t, which is a real.
%       return:     a n-dimension vector representing the probability 
%                   for the walker at each position at the time t.

%   Copyright 2014, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function D_t = quantum_walk_pst_distribution(x, n, t)
    D_t = zeros(n);
    for i = -n : n       
        % $\braket{x}{\psi(t)}=\frac{1}{2\pi}\int_{-\pi}^{\pi}\dif{k}\eu^{2\iu\cos(k)t+\iu kx}$
        p_x = 1/(2*pi)*integral(@(k) exp(2*1i*cos(k)*t+1i*k*x), -pi, pi);        
        D_t(x+n+1) = abs(p_x);
    end
end