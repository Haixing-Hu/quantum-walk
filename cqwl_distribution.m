%CQWL_DISTRIBUTION Calculate the position distribution of the evolution of
%          a continous-time quantum walk on a line.  
%
%  CQWL_DISTRIBUTION(H, s, t) Calculate the position distribution of the 
%                             evolution of a continous-time quantum walk on 
%                             a line. 
%       H:          the Hamiltonian of the system, which should be a n * n
%                   matrix.
%       s:          the initial state of the system.
%       t:          the time (or steps) of the evolution.
%       return:     a n-dimension vector representing the probability 
%                   for the walker at each position at the time t.

%   Copyright 2015, Haixing Hu.
%   Department of Computer Science & Technology, 
%   School of Physics,
%   Nanjing University, China.

function d = cqwl_distribution(H, s, t)
    % |\psi(t)> = e^{iHt}|\psi_0>
    d = expm(sqrt(-1) * H * t) * s;
end