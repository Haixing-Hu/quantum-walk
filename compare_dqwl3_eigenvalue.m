%PLOT_EIGENVALUE Plot the distribution of eigenvalues of a matrix.
%
%  PLOT_EIGENVALUE(M) Plot the distribution of eigenvalues of a matrix.
%       M:        the square matrix.

%   Copyright 2015, Haixing Hu.
%   Department of Computer Science & Technology, 
%   School of Physics,
%   Nanjing University, China.

function compare_dqwl3_eigenvalue(n)
    clc;
    tic;
        
    subplot(2,2,1,'replace');    
    plot(dqwl(n));
    
    subplot(2,2,2,'replace');
    M_c = dqwl_coin_transformation(n);     % the coin transformation 
    M_p = dqwl_position_transformation(n); % the position transformation
    M   = M_p * M_c;         
    plot_eigenvalue_abs(M);    
    
    subplot(2,2,3,'replace');    
    plot(dqwl3(n));
    
    subplot(2,2,4,'replace');
    M_3c = dqwl3_coin_transformation(n);     % the coin transformation 
    M_3p = dqwl3_position_transformation(n); % the position transformation
    M3   = M_3p * M_3c;         
    plot_eigenvalue_abs(M3);
    
    toc;
end