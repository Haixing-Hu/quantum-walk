%GLUED_TREE_ADJACENCY Generates the adjacency matrix of a glued tree.
%
%  GLUED_TREE_ADJACENCY(n) Generates the adjacency matrix of a glued tree.
%       n:          The degree of the glued tree.
%       random:     Indicate whether to randomize the connections between 
%                   two connected binary trees.
%       return:     The adjacency matrix of the specified glued tree. The  
%                   nodes of the glued tree are numbered sequentially from  
%                   left to right, and from top to bottom. Note that if the
%                   argument "random" is false, the glued tree has 3*2^n-2
%                   nodes; if the argumnet "random" is true, the glued tree
%                   has 4*2^n-2 nodes.
%   Copyright 2017, Haixing Hu.
%   School of Physics, Nanjing University, China.

function A = glued_tree_adjacency(n, random)
    if random
        m = 2 * (2.^(n+1) - 1); 
    else
        m = 3 * 2.^n - 2;
    end              
    A = zeros(m, m); 
    for i = 1 : n 
        start = 2.^i;
        count = 2.^i;
        for j = 1 : count 
            c1 = start + j - 1;
            p1 = floor(c1 / 2);
            A(c1, p1) = 1;
            A(p1, c1) = 1;
            c2 = m - c1 + 1;
            p2 = m - p1 + 1;
            A(c2, p2) = 1;
            A(p2, c2) = 1;            
        end
    end
    if random   % randomly connect the leaves between two binary trees
        used = zeros(m, 1);
        left_start  = 2.^n;
        right_start = 2.^(n + 1);
        count = 2.^n;
        x = left_start;
        used(x) = 1;
        for i = 1 : count
            % randomly select node y
            y = randi([right_start, right_start + count - 1]);
            while used(y) == 1
                y = randi([right_start, right_start + count - 1]);
            end
            used(y) = 1;
            A(x, y) = 1;
            A(y, x) = 1;
            if i < count
                % randomly select node x
                x = randi([left_start, left_start + count - 1]);
                while used(x) == 1
                    x = randi([left_start, left_start + count - 1]);
                end
            else  % i == count, select x as the left_start
                x = left_start;
            end            
            used(x) = 1;
            A(x, y) = 1;
            A(y, x) = 1;
        end
    end
end