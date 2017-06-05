%CTRW_GLUED_TREE_CONVERGENCE Calculate the convergence time of 
%                     continuous-time random walks on a glued binary tree.
%
%  CTRW_GLUED_TREE_CONVERGENCE(n, T) Calculate the convergence 
%                   time of continuous-time random walks on a glued binary
%                   tree.
%       n:          the maximum level of the glued tree.
%       random:     whether the glued tree should be randomized.
%       k:          the jumpping rate.
%       return:     The convergence time.

%   Copyright 2017, Haixing Hu.
%   School of Physics, Nanjing University, China.

function c = ctrw_glued_tree_convergence(n, random, k)   
    if (n < 1) 
        error('ERROR: level must be at least 1.');
    end        
    
    fprintf('INFO: Calculating the adjacency matrix of a glued binary tree of level %d ...\n', n);
    H = glued_tree_hamiltonian(n, random, k);
    m = size(H, 1);
    psi_0 = zeros(m, 1);
    psi_0(1) = 1;
    
    T = 1000;
    precision = 0.1;
    
    count = 0;
    fprintf('INFO: Calculating the convergence time of continuous-time random walk on a glued binary tree of level %d ...\n', n);
           
    for t = 0.0 : precision : T
        count = count + 1;        
        psi = expm(-H * t) * psi_0;
        if is_stationary_distribution(psi)
            c = t;
            return;
        end
    end
    c = 0;
    return;
end