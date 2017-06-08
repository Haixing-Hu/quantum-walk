%PLOT_CQW_GLUED_TREE_COLUMN_PROB Plot the probability distribution of columns 
%                of a continuous-time quantum walk on a glued tree.
%
%  PLOT_CQW_GLUED_TREE_COLUMN_PROB(n, random, k, s) Plot the probability  
%          distribution of columns of a continuous-time quantum walk on a glued tree.
%       n:          The level of the glued tree.
%       random:     Indicate whether to randomize the connections between 
%                   two connected binary trees.
%       T:          The maximum time of evolution.
%       k:          the jumpping rate of the glued binary tree.
%       s:          the label of a column.
%
%   Copyright 2017, Haixing Hu.
%   School of Physics, Nanjing University, China.

function plot_cqw_glued_tree_column_prob(n, random, k, s)       
    if (n < 1) 
        error('ERROR: level must be at least 1.');
    end
    if (s < 1) || (s > 2 * (n + 1))
        error('ERROR: invalid column label.'); 
    end  
    
    fprintf('INFO: Calculating the Hamiltonian of a glued binary tree of level %d ...\n', n);
    H = glued_tree_hamiltonian(n, random, k);
    m = size(H, 1);        
    psi_0 = zeros(m, 1);
    psi_0(1) = 1;
        
    T = 100;
    precision = 0.1;
    
    count = 0;
    fprintf('INFO: Calculating the exit probablity of continuous-time random walk on a glued binary tree of level %d ...\n', n);        
    p = zeros(ceil((1 / precision) * T), 1);
    for t = 0.0 : precision : T
        count = count + 1;        
        psi = expm(-i * H * t) * psi_0;
        c = glued_tree_column_distribution(n, random, psi);        
        p(count, 1) = c(s);
    end
    plot(0.0: precision : T, p);
    xlabel('time');
    ylabel('probability');    
end