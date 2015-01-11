%DQWL Simulate the discrete quantum on a line.
%
%   DQWL(n [,s_c]) Simulate the discrete quantum on a line.
%       n:      the number of steps of the quantum walk.
%       s_c:    (optional) the initial state of the direction coin.
%       return: a (2*n+1)-dimension vector representing the probability at 
%               each position after n-steps of quantum walk.                   

%   Copyright 2013, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function s_p = dqwl(n, varargin)                  

    d = 2 * n + 1;                          % the dimension of position states
    H   = (1/sqrt(2)) * [1,1;1,-1];         % the Hadamard transformation for a qubit
    
    M_c = kron(eye(d), H);                  % the coin transformation 
    M_p = dqwl_postrans(n);                 % the position transformation    
    M   = M_p * M_c;                        % the whole transformation

    % set the initial direction coin state s_c
    if length(varargin) > 0
        s_c = varargin{1};
    else 
        % s_c = \frac{1}{\sqrt(2)}(|0> + i|1>)
        s_c = (1/sqrt(2)) * (qubit(0) + i * qubit(1));      
    end
    s_p = basis(d, n+1);                    % set the initial position state s_p
    s   = kron(s_p, s_c);                   % set the whole state s

    check_unitary(M);                       % check the unitary of the transformation matrix
    
    for k = 1 : n
        s = M * s;
    end
    s_p = dqwl_measure(s, n);               % measure the position state
end    