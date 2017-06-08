%PLOT_CQW_GLUED_BOSONIC_TREE_NODE_PROB Plot the probability distribution of nodes 
%                of a continuous-time quantum walk of two bosonics on a glued tree.
%
%  PLOT_CQW_GLUED_BOSONIC_TREE_NODE_PROB(n, random, T, precision) Plot the probability  
%          distribution of nodes of a continuous-time quantum walk of two bosonics 
%          on a glued tree.
%       n:          The level of the glued tree.
%       random:     Indicate whether to randomize the connections between 
%                   two connected binary trees.
%       T:          The maximum time of evolution.
%       k:          the jumpping rate of the glued binary tree.
%       a:          the start node of the first bosonic.
%       b:          the start node of the second bosonic.
%       s:          the label of a node.
%
%   Copyright 2017, Haixing Hu.
%   School of Physics, Nanjing University, China.

function plot_cqw_bosonic_glued_tree_node_prob(n, random, k, a, b, s)       
    if (n < 1) 
        error('ERROR: level must be at least 1.');
    end
    
    fprintf('INFO: Calculating the Hamiltonian of a glued binary tree of level %d ...\n', n);
    H = glued_tree_hamiltonian(n, random, k);
    m = size(H, 1);
    if (a < 1) || (a > m)
        error('ERROR: invalid start node of the first bosonic.');
    end
    if (b < 1) || (b > m)
        error('ERROR: invalid start node of the first bosonic.');
    end
    if (s < 1) || (s > m)
        error('ERROR: invalid node label.'); 
    end
    
    psi_a_0 = zeros(m, 1);
    psi_a_0(a) = 1;
    psi_b_0 = zeros(m, 1);
    psi_b_0(b) = 1;
        
    T = 100;
    precision = 0.1;    
    X = 1:1:m;
    Y = 1:1:m;
    
    count = 0;
    fprintf('INFO: Calculating the exit probablity of continuous-time random walk on a glued binary tree of level %d ...\n', n);        
    p = zeros(ceil((1 / precision) * T), 1);
    for t = 0.0 : precision : T
        count = count + 1;        
        psi_a = expm(-i * H * t) * psi_a_0;
        psi_b = expm(-i * H * t) * psi_b_0;
        psi = bosonic_state(psi_a, psi_b);
        Z = abs(psi).^2;
        surf(X, Y, Z);
        xlabel('position 1');
        ylabel('position 2');
        zlabel('probability');
         M(count) = getframe;
    end
    movie(M);
end