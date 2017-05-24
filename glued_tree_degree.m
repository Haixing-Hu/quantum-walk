%GLUED_TREE_DEGREE Generates the degree matrix of a glued tree.
%
%  GLUED_TREE_DEGREE(n) Generates the degree matrix of a glued tree.
%       n:          The rank of the glued tree.
%       random:     Indicate whether to randomize the connections between 
%                   two connected binary trees.
%       return:     The degree matrix of the specified glued tree. The  
%                   nodes of the glued tree are numbered sequentially from  
%                   left to right, and from top to bottom. Note that if the
%                   argument "random" is false, the glued tree has 3*2^n-2
%                   nodes; if the argumnet "random" is true, the glued tree
%                   has 4*2^n-2 nodes.
%   Copyright 2017, Haixing Hu.
%   School of Physics, Nanjing University, China.

function D = glued_tree_degree(n, random)
    if random
        m = 2 * (2.^(n+1) - 1); 
    else
        m = 3 * 2.^n - 2;
    end              
    D = zeros(m, m); 
    for i = 1 : n 
        start = 2.^i;
        count = 2.^i;
        for j = 1 : count 
            c1 = start + j - 1;
            p1 = floor(c1 / 2);
            D(c1, c1) = D(c1, c1) + 1;
            D(p1, p1) = D(p1, p1) + 1;
            c2 = m - c1 + 1;
            p2 = m - p1 + 1;
            D(c2, c2) = D(c2, c2) + 1;
            D(p2, p2) = D(p2, p2) + 1;
        end
    end
    if random 
        start = 2.^n;
        count = 2.^n;
        for j = 1 : count 
            c1 = start + j - 1;
            c2 = m - c1 + 1;
            D(c1, c1) = D(c1, c1) + 2;
            D(c2, c2) = D(c2, c2) + 2;            
        end 
    end
end