%PLOT_CQWL_ANDERSON_EIGENVALUE Plot the eigenvalue distribution of the Hamiltonian
%          of a continous-time quantum walk on a line with Anderson localizations.  
%
%  PLOT_CQWL_ANDERSON_EIGENVALUE(n,k) Plot the eigenvalue distribution of the Hamiltonian
%                 of a continous-time quantum walk on a line with Anderson localizations.   
%       n:        the maximum steps of the quantum walk.
%       k:        the couple factor.
%       d:        the disorder factor (absolute value).

%   Copyright 2015, Haixing Hu.
%   Department of Computer Science & Technology, 
%   School of Physics,
%   Nanjing University, China.

function plot_cqwl_anderson_eigenvalue(n, k, d)
    H = cqwl_hamiltonian(n, k);
    M = disorder(H, d);
    plot_eigenvalue(M);
end