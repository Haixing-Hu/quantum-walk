%PLOT_CQWL_ANDERSON Plot the position distribution of the evolution of
%          a continous-time quantum walk on a line with Anderson 
%          localizations.  
%
%  PLOT_CQWL_ANDERSON(n,k) Plot the position distribution of the evolution of 
%                 a continous-time quantum walk on a line with Anderson 
%                 localizations.  
%       n:        the maximum steps of the quantum walk.
%       k:        the couple factor.
%       d:        the disorder factor (absolute value).

%   Copyright 2015, Haixing Hu.
%   Department of Computer Science & Technology, 
%   School of Physics,
%   Nanjing University, China.

function plot_cqwl_anderson(n, k, d)
    H = cqwl_hamiltonian(n, k);
    M = disorder(H, d);
    s = cqwl_initial_state(n);
    d = cqwl_distribution(M, s, n);
    plot_distribution(d);
end