%GLUED_TREE_COLUMN_DISTRIBUTION Calculate the probability distribution of the walker
%                        on columns of a continue-time quantum walk on a 
%                        glued tree.
%
%  GLUED_TREE_COLUMN_DISTRIBUTION(n) Calculate the probability distribution of the walker
%                        on columns of a continue-time quantum walk on a 
%                        glued tree.
%        w:          The number of dependent walkers.
%        n:          The rank of the glued tree.
%        random:     Indicate whether to randomize the connections between 
%                    two connected binary trees.
%        s:          The state of the walkers.
%        return:     the probability distribution of the walker on columns 
%                    of a continue-time quantum walk on a glued tree.
%   Copyright 2017, Haixing Hu.
%   School of Physics, Nanjing University, China.

function d = glued_tree_column_distribution(w, n, random, s)
    c = glued_tree_column_state(w, n, random, s);
    d = abs(c).^2;
end