%NONLINEAR_DQWL Simulate the non-linear discrete quantum on a line 
%                        with two coins.
%
%  NONLINEAR_DQWL(n [, s_w, s_c]) Simulate the non-linear discrete 
%                   quantum on a line with two coins.
%       n:          the number of steps of the quantum walk.
%       s_w:        (optional) the initial state of the walking coin.
%       s_c:        (optional) the initial state of the direction coin.
%       return:     a (2*n+1)-dimension vector representing the probability 
%                   at each position after n-steps of quantum walk.                   

%   Copyright 2013, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function s_p = nonlinear_dqwl(n, varargin)                  

    d   = 2 * n + 1;                        % the dimension of position states
    H   = (1/sqrt(2)) * [1,1;1,-1];         % the Hadamard transformation for a qubit
    
    disp('INFO: Preparing the transformation matrix and the initial state vector...');
    M_w = nonlinear_dqwl_walkcointrans(n);  % the walk coin transformation 
    %M_w = mkron(eye(d), eye(2), H);         % the walk coin transformation 
    M_c = mkron(eye(d), H, eye(2));         % the direction coin transformation 
    M_p = nonlinear_dqwl_postrans(n);       % the position transformation    
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
    
    disp(['INFO: Simulating the quantum walk in ', int2str(n), ' steps...']);
    for k = 1 : n
        s = M * s;
    end
    nonlinear_dqwl_verify(s, n);            % verify the state vector
    s_p = nonlinear_dqwl_measure(s, n);     % measure the position state
end    