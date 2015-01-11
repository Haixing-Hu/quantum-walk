%TWO_COIN_DQWL Simulate the discrete quantum on a line with two coins: one
%              is used to control whether to walk or stay; another is used
%              to control which direction to walk.
%
%  TWO_COIN_DQWL(n [, s_w, s_c]) Simulate the discrete quantum on a line 
%                   with two coins.
%       n:          the number of steps of the quantum walk.
%       s_w:        (optional) the initial state of the walking coin.
%       s_c:        (optional) the initial state of the direction coin.
%       return:     a (2*n+1)-dimension vector representing the probability 
%                   at each position after n-steps of quantum walk.                   

%   Copyright 2013, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function s_p = two_coin_dqwl(n, varargin)                  

    d   = 2 * n + 1;                        % the dimension of position states
    H   = (1/sqrt(2)) * [1,1;1,-1];         % the Hadamard transformation for a qubit
    
    M_w = mkron(eye(d), eye(2), H);         % the walking coin transformation     
    M_c = mkron(eye(d), H, eye(2));         % the direction coin transformation 
    M_p = two_coin_dqwl_postrans(n);        % the position transformation    
    M   = M_p * M_c * M_w;                  % the whole transformation

    % set the walking coin state s_w
    if length(varargin) >= 1
        s_w = varargin{1};                  
    else
        % s_w = \frac{1}{\sqrt(2)}(|0> + i|1>)
        s_w = (1/sqrt(2)) * (qubit(0) + i * qubit(1));   
    end
    % set the direction coin state s_c
    if (length(varargin) >= 2) 
        s_c = varargin{2}; 
    else 
        % s_c = \frac{1}{\sqrt(2)}(|0> + i|1>)
        s_c = (1/sqrt(2)) * (qubit(0) + i * qubit(1));       
    end
    
    s_p = basis(d, n+1);                    % the position state
    s   = mkron(s_p, s_c, s_w);             % the whole state

    check_unitary(M);                       % check the unitary of the transformation matrix
    
    for k = 1 : n
        s = M * s;
    end
    s_p = two_coin_dqwl_measure(s, n);      % measure the position state
end    