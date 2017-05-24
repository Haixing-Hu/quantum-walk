%GLUED_TREE_HALMILTONIAN Generates the Halmiltonian of a glued tree.
%
%  GLUED_TREE_HALMILTONIAN(n) Generates the Halmiltonian of a glued tree.
%       n:          The degree of the glued tree.
%       random:     Indicate whether to randomize the connections between 
%                   two connected binary trees.
%       return:     The Halmiltonian of the specified glued tree. The nodes 
%                   of the glued tree are numbered sequentially from left 
%                   to right, and from top to bottom. Note that if the
%                   argument "random" is false, the glued tree has 3*2^n-1
%                   nodes; if the argumnet "random" is true, the glued tree
%                   has 4*2^n-2 nodes.
%   Copyright 2017, Haixing Hu.
%   School of Physics, Nanjing University, China.

function H = glued_tree_halmiltonian(n, random)
    A = glued_tree_adjacency(n, random);
    D = glued_tree_degree(n, random);
    H = D - A;
end