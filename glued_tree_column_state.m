%GLUED_TREE_COLUMN_STATE Calculate the column state of the evolution of a
%                        continue-time quantum walk on a glued tree.
%
%  GLUED_TREE_COLUMN_STATE(w, n, random, S) Calculate the column state of 
%          the evolution of acontinue-time quantum walk on a glued tree.
%        w:          The number of dependent walkers.
%        n:          The rank of the glued tree.
%        random:     Indicate whether to randomize the connections between 
%                    two connected binary trees.
%        s:          The position state of the evolution.
%        return:     the column state of the evolution of a continue-time
%                    quantum walk on a glued tree.
%   Copyright 2017, Haixing Hu.
%   School of Physics, Nanjing University, China.

function c = glued_tree_column_state(w, n, random, s)
    if random 
        m = 2 * (2.^(n+1) - 1); 
        k = 2 * (n + 1);
    else
        m = 3 * 2.^n - 2;
        k = 2 * (n + 1) - 1;
    end
    c = zeros(k, 1);
    for i = 0 : n - 1
        count = 2.^i;
        left_start = 2.^i;
        right_start = (m - left_start + 1) - count + 1;
        c(i + 1) = sum(s(left_start : left_start + count - 1))/sqrt(count);
        c(k - i) = sum(s(right_start : right_start + count - 1))/sqrt(count);
    end
    if random
        count = 2.^n;
        left_start = 2.^n;
        right_start = (m - left_start + 1) - count + 1;
        c(n + 1) = sum(s(left_start : left_start + count - 1))/sqrt(count);
        c(k - n) = sum(s(right_start : right_start + count - 1))/sqrt(count);
    else
        count = 2.^n;
        left_start = 2.^n;
        c(n + 1) = sum(s(left_start : left_start + count - 1))/sqrt(count);
    end
end