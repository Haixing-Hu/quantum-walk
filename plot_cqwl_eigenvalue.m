%PLOT_CQWL_EIGENVALUE Plot the eigenvalue distribution of the Hamiltonian
%          of a continous-time quantum walk on a line.  
%
%  PLOT_CQWL_EIGENVALUE(n,k) Plot the eigenvalue distribution of the Hamiltonian
%                 of a continous-time quantum walk on a line.   
%       n:        the maximum steps of the quantum walk.
%       k:        the couple factor.

%   Copyright 2015, Haixing Hu.
%   Department of Computer Science & Technology, 
%   School of Physics,
%   Nanjing University, China.

function plot_cqwl_eigenvalue(n, k)
    H = cqwl_hamiltonian(n, k);
    plot_eigenvalue(H);
end