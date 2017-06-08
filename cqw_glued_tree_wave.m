%CQW_GLUED_TREE_WAVE Generate the probability wave of a 
%       continuous-time quantum walk on a glued tree.
%
%  CQW_GLUED_TREE_WAVE(n, random, k, s) Generate the probability    
%          wave of a continuous-time quantum walk on a glued tree.
%       n:          The level of the glued tree.
%       random:     Indicate whether to randomize the connections between 
%                   two connected binary trees.
%       T:          The maximum time of evolution.
%       k:          the jumpping rate of the glued binary tree.
%
%   Copyright 2017, Haixing Hu.
%   School of Physics, Nanjing University, China.

function cqw_glued_tree_wave(n, random, k)       
    if (n < 1) 
        error('ERROR: level must be at least 1.');
    end
    
    fprintf('INFO: Calculating the Hamiltonian of a glued binary tree of level %d ...\n', n);
    H = glued_tree_hamiltonian(n, random, k);
    m = size(H, 1);
    
    psi_0 = zeros(m, 1);
    psi_0(1) = 1;
        
    T = 100;
    precision = 0.1;    
    X = 1:1:m;
    
    close all; clc;
    filename = input('Input the file name to save the animation video (*.avi): ','s');
    aviobj= VideoWriter(filename);   
    open(aviobj);
    
    count = 0;
    fprintf('INFO: Calculating the exit probablity of continuous-time quantum walk on a glued binary tree of level %d ...\n', n);        
    p = zeros(ceil((1 / precision) * T), 1);
    for t = 0.0 : precision : T
        count = count + 1;        
        psi = expm(-i * H * t) * psi_0;
        Y = abs(psi).^2;
        plot(X, Y);
        xlabel('position');
        ylabel('probability');
        M(count) = getframe;
        writeVideo(aviobj, M(count));
    end    
    close(aviobj); 
    movie(M);
end