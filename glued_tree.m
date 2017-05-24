%GLUED_TREE Calculuate the evolution of a continuous-time quantum walk on 
%           a glued tree.
%
%  GLUED_TREE(w, n, random, t) Calculuate the evolution of a continuous-time  
%                   quantum walk on a glued tree.
%       w:          The number of dependent walkers.
%       n:          The rank of the glued tree.
%       random:     Indicate whether to randomize the connections between 
%                   two connected binary trees.
%       t:          The time of evolution.
%       return:     The final state of the evolution.
%   Copyright 2017, Haixing Hu.
%   School of Physics, Nanjing University, China.

function s = glued_tree(w, n, random, t)
   H = glued_tree_hamiltonian(n, random);
   m = size(H, 1);
   s0 = zeros(m, 1);
   s0(1) = 1;
   s = expm(sqrt(-1) * H * t) * s0;
end