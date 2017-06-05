

function plot_ctrw_glued_tree_convergence(N)
    c = zeros(N, 1);
    for i = 1 : N
        c(i, 1) = ctrw_glued_tree_convergence(i, true, 1);
    end
    plot(1:N, c);
    xlabel('level');
    ylabel('convergence time');
end