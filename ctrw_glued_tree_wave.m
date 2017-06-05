%CTRW_GLUED_TREE_WAVE Generates the animation of the probability wave of 
%                     continuous-time random walks on a glued binary tree.
%
%  CTRW_GLUED_TREE_WAVE(n, T) Generates the animation of the probability
%                   wave of continuous-time random walks on a glued binary
%                   tree.
%       n:          the level of the glued tree.
%       random:     whether the glued tree should be randomized.
%       k:          the jumpping rate.
%       T:          a real number, representing the range of the time of 
%                   evolution.
%       return:     After calling this funciton, an animation will be
%                   displayed in a window and will be saved to the file
%                   specified by the user.

%   Copyright 2017, Haixing Hu.
%   School of Physics, Nanjing University, China.

function ctrw_glued_tree_wave(n, random, k, T)
    close all; clc;
    
    if (n < 1) 
        error('ERROR: level must be at least 1.');
    end
    if (T <= 0) 
        error('ERROR: value of time must be positive.');
    end    
        
    filename = input('Input the file name to save the animation video (*.avi): ','s');
    aviobj= VideoWriter(filename);   
    open(aviobj);
    
    disp('INFO: Calculating the adjacency matrix of a glued binary tree ...');
    H = glued_tree_hamiltonian(n, random, k);
    m = size(H, 1);
    psi_0 = zeros(m, 1);
    psi_0(1) = 1;
    
    precision = 0.1;
   
    count = 0;
    disp('INFO: Calculating the probability distribution of continuous-time random walk on a glued binary tree ...');
    psi = cell(ceil((1 / precision) * T), 1);
    for t = 0.0 : precision : T
        count = count + 1;        
        psi{count,1} = expm(-H * t) * psi_0;
    end
    
    x = 1 : m;
    disp('INFO: Generating moive...');        
    for i = 1 : count        
        p = psi{i, 1};          
        plot(x, p, 'b-'); 
        xlabel('position');
        ylabel('probability');                
        axis([1, m, 0, 1.05]);
        if (m < 32) 
            set(gca, 'xtick', 1 : m);
        end
        M(i) = getframe;
        writeVideo(aviobj, M(i));
    end
    close(aviobj); 
    movie(M);       
end