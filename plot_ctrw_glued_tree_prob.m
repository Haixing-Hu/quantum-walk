

function plot_ctrw_glued_tree_exit_prob(n, random, k, s)
    if (n < 1) 
        error('ERROR: level must be at least 1.');
    end        
    
    fprintf('INFO: Calculating the adjacency matrix of a glued binary tree of level %d ...\n', n);
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
        psi = expm(-H * t) * psi_0;
        p(count, 1) = psi(s);
    end
    plot(0.0: precision : T, p);
    xlabel('time');
    ylabel('exit probability');
end