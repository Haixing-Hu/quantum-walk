%DQWL3 Simulate the 3-states discrete-time quantum on a line.
%
%   DQWL3(n [,s_c]) Simulate the 3-states discrete-time quantum on a line.
%       n:      the number of steps of the quantum walk.
%       s_c:    (optional) the initial state of the direction coin.
%       return: a (2*n+1)-dimension vector representing the probability at 
%               each position after n-steps of quantum walk.                   

%   Copyright 2013, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function s_p = dqwl3(n, varargin)                  
    d = 2 * n + 1;                          % the dimension of position states    
    M_c = dqwl3_coin_transformation(n);     % the coin transformation 
    M_p = dqwl3_position_transformation(n); % the position transformation
    M   = M_p * M_c;                        % the whole transformation
    
%     disp('INFO: Checking the unitary of position transformatin ...');
%     check_unitary(M_p);
%     disp('INFO: Checking the unitary of coin transformatin ...');
%     check_unitary(M_c);
%     disp('INFO: Checking the unitary of whole transformatin ...');
%     check_unitary(M);

    % set the initial direction coin state s_c
    if length(varargin) > 0
        s_c = varargin{1};
    else 
        % s_c = \frac{1}{\sqrt(3)}(|L> + |S> + |R>)
        s_c = (1/sqrt(3)) * (qutrit(0) + qutrit(1) + qutrit(2));  
    end
    s_p = basis(d, n+1);                    % set the initial position state s_p
    s   = kron(s_p, s_c);                   % set the whole state s
    
%     disp('size(s_p)=');disp(size(s_p));
%     disp('size(s_c)=');disp(size(s_c));
%     disp('size(M)=');disp(size(M));
%     disp('size(s)=');disp(size(s));
    for k = 1 : n
        s = M * s;
    end
    s_p = dqwl3_measure(s, n);               % measure the position state
end    