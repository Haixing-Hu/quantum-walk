%MKRON  Calculates the Kronecker (tensor) product of several matrices.
%
%   MKRON(M1, M2, M3, ...) Calculates the Kronecker (tensor) product of 
%                          several matrices.
%       M1, M2, M3 ...:    the matrices.
%       return:            the Kronecker (tensor) product of the argument 
%                          matrices. 

%   Copyright 2013, Haixing Hu
%   Department of Computer Science & Technology, Nanjing University, China.

function K = mkron(A, B, varargin)
    K = kron(A, B);
    for i = 1 : length(varargin)
        K = kron(K, varargin{i});
    end
end
