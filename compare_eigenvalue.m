%PLOT_EIGENVALUE Plot the distribution of eigenvalues of a matrix.
%
%  PLOT_EIGENVALUE(M) Plot the distribution of eigenvalues of a matrix.
%       M:        the square matrix.

%   Copyright 2015, Haixing Hu.
%   Department of Computer Science & Technology, 
%   School of Physics,
%   Nanjing University, China.

function compare_eigenvalue(n, k, e)
    subplot(5,2,1,'replace');
    H = cqwl_hamiltonian(n, k);
    s = cqwl_initial_state(n);
    d = cqwl_distribution(H, s, n);
    plot_distribution(d);
    
    subplot(5,2,2,'replace');
    plot_eigenvalue(H);
    
    subplot(5,2,3,'replace');
    M = disorder(H, e);
    d = cqwl_distribution(M, s, n);
    plot_distribution(d);
    
    subplot(5,2,4,'replace');
    plot_eigenvalue(M);
    
    subplot(5,2,5,'replace');
    M = disorder(H, e);
    d = cqwl_distribution(M, s, n);
    plot_distribution(d);
    
    subplot(5,2,6,'replace');
    plot_eigenvalue(M);
    
    subplot(5,2,7,'replace');
    M = disorder(H, e);
    d = cqwl_distribution(M, s, n);
    plot_distribution(d);
    
    subplot(5,2,8,'replace');
    plot_eigenvalue(M);
    
    subplot(5,2,9,'replace');
    M = disorder(H, e);
    d = cqwl_distribution(M, s, n);
    plot_distribution(d);
    
    subplot(5,2,10,'replace');
    plot_eigenvalue(M);
end