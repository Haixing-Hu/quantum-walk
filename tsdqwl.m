%DQWL Simulate the 3-states discrete quantum on a line.
%
%   DQWL(n [,s_c]) Simulate the 3-states discrete time quantum on a line.
%       n:      the number of steps of the quantum walk.
%       s_c:    (optional) the initial state of the direction coin.
%       return: a (2*n+1)-dimension vector representing the probability at 
%               each position after n-steps of quantum walk.                   

%   Copyright 2015, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function s_p = tsdqwl(n, varargin)                  

    d = 2 * n + 1;                          % the dimension of position states
    G = (1/3) * [-1,2,2; 2,-1,2; 2,2,-1];   % the Grove transformation for a qutrit
    
    M_c = kron(eye(d), G);                  % the coin transformation 
    M_p = tsdqwl_postrans(n);               % the position transformation    
    M   = M_p * M_c;                        % the whole transformation

    % set the initial direction coin state s_c
    if length(varargin) > 0
        s_c = varargin{1};
    else 
        % s_c = \frac{1}{\sqrt(3)}(|L> + |S> + |R>)
        s_c = (1/sqrt(3)) * (qutrit(0) + qutrit(1) + qutrit(2));      
    end
    s_p = basis(d, n+1);                    % set the initial position state s_p
    s   = kron(s_p, s_c);                   % set the whole state s

    check_unitary(M);                       % check the unitary of the transformation matrix
    
    for k = 1 : n
        s = M * s;
    end
    s_p = tsdqwl_measure(s, n);               % measure the position state
end