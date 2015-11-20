%PLOT_EIGENVALUE Plot the distribution of eigenvalues of a matrix.
%
%  PLOT_EIGENVALUE(M) Plot the distribution of eigenvalues of a matrix.
%       M:        the square matrix.

%   Copyright 2015, Haixing Hu.
%   Department of Computer Science & Technology, 
%   School of Physics,
%   Nanjing University, China.

function plot_eigenvalue(M)
    e = eig(M);
    y = histcounts(e);    
    hist(y);
end