
function p=ctrw_glued_tree_distribution(A, t)
    n = size(A, 1);
    p0 = zeros(n,1);
    p0(1) = 1;
    p = expm(-A*t)*p0;
end
