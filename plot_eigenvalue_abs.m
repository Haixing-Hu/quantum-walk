%PLOT_EIGENVALUE Plot the distribution of eigenvalues of a matrix.
%
%  PLOT_EIGENVALUE(M) Plot the distribution of eigenvalues of a matrix.
%       M:        the square matrix.

%   Copyright 2015, Haixing Hu.
%   Department of Computer Science & Technology, 
%   School of Physics,
%   Nanjing University, China.

function plot_eigenvalue_abs(M)
    e = eig(M);
    e = abs(e);
    x = unique(e);
    y = hist(e, x);
%      disp('sizeof(e) = '); disp(size(e,1));
%      disp('e = '); disp(sort(e));
%      disp('sizeof(x) = '); disp(size(x,1));
%      disp('x = '); disp(x);
%      disp('sizeof(y) = '); disp(size(y,2));
%      disp('y = '); disp(y);
    plot(x, y);
end