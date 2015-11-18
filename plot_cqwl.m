%PLOT_CQWL Plot the position distribution of the evolution of
%          a continous-time quantum walk on a line.  
%
%  PLOT_CQWL(n,k) Plot the position distribution of the evolution of 
%                 a continous-time quantum walk on a line. 
%       n:        the maximum steps of the quantum walk.
%       k:        the couple factor.

%   Copyright 2015, Haixing Hu.
%   Department of Computer Science & Technology, 
%   School of Physics,
%   Nanjing University, China.

function plot_cqwl(n, k)
    H = cqwl_hamiltonian(n, k);
    s = cqwl_initial_state(n);
    d = cqwl_distribution(H, s, n);
    plot_distribution(d);
end