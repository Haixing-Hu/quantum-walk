%PLOT_CTRW_GLUED_TREE_CONVERGENCE Plot the convergence time of
%continuous-time random walk on a glued binary tree.
%
%  PLOT_CTRW_GLUED_TREE_CONVERGENCE(N) Plot the convergence time of
%                                       continuous-time random walk on a 
%                                       glued binary tree.
%       N:        the maximum level of the glued binary tree.
%       random:   indicate whether the glued binary tree should be
%                 randomized.
%       k:        the jumpping rate of the glued binary tree.
%
%   Copyright 2017, Haixing Hu.
%   Department of Computer Science & Technology, 
%   School of Physics,
%   Nanjing University, China.
function plot_ctrw_glued_tree_convergence(N, random, k)
    c = zeros(N, 1);
    for i = 1 : N
        c(i, 1) = ctrw_glued_tree_convergence(i, random, k);
    end
    plot(1:N, c);
    xlabel('level');
    ylabel('convergence time');
end