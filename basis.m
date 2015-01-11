%BASIS  Calculates the standard basis.
%
%   BASIS(n,i)  Calculates the i-th standard basis of a n-dimension vector.
%       n:      the dimension of vectors.
%       i:      the i-th standard basis to be calculated.
%       return: a n-dimension vector representing the i-th standard basis
%               of the n-dimension vector space.

%   Copyright 2013, Haixing Hu
%   Department of Computer Science & Technology, Nanjing University, China.

function b = basis(n, i)
    x = eye(n);
    if (i == 0) 
        b = x(:, n);
    elseif (i == n + 1) 
        b = x(:, 1);
    else
        b = x(:, i);
    end
end    