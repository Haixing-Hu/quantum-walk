%PLOT_GLUED_TREE Plot the 3-D probability distribution of a continuous-time 
%                quantum walk on a glued tree.
%
%  PLOT_GLUED_TREE(w, n, random, T, precision) Plot the 3-D probability  
%          distribution of a continuous-time quantum walk on a glued tree.
%       w:          The number of dependent walkers.
%       n:          The rank of the glued tree.
%       random:     Indicate whether to randomize the connections between 
%                   two connected binary trees.
%       T:          The maximum time of evolution.
%       precision:  The precision of evolution. Default value is 1.
%       return:     The final state of the evolution.
%   Copyright 2017, Haixing Hu.
%   School of Physics, Nanjing University, China.

function plot_glued_tree(w, n, random, T, precision)       
    if random 
        m = 2 * (2.^(n+1) - 1); 
        k = 2 * (n + 1);
    else
        m = 3 * 2.^n - 2;
        k = 2 * (n + 1) - 1;
    end
    H = glued_tree_hamiltonian(n, random);
    s0 = zeros(m, 1);
    s0(1) = 1;    
    [COL, TIME] = meshgrid(1:k, 0:precision:T);
    DIST = zeros(size(COL));
%     disp('TIME = '); disp(TIME);
%     disp('COL = '); disp(COL);
%     disp('DIST = '); disp(DIST);
    for t = 0 : precision : T
%         disp('t = '); disp(t);
        s = expm(sqrt(-1) * H * t) * s0;
        d = glued_tree_column_distribution(w, n, random, s);
        row = round(t / precision + 1);
%         disp('row = '); disp(row);
        DIST(row, :) = d;
%         disp('DIST = '); disp(DIST);
    end
    surf(COL, TIME, DIST);
    xlabel('Column');
    ylabel('time');
    zlabel('probability');
end