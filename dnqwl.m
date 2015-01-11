
%DNQWL Simulate the non-linear discrete quantum on a line.
%
%   DNQWL(n) Simulate the non-linear discrete quantum on a line.
%   n:       the number of steps of the quantum walk.
%   return: a (2*n+1)-dimension vector representing the probability at each 
%           position after n-steps of quantum walk.                   

%   Copyright 2013, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function s_p = dnqwl(n)                  

    d = 2 * n + 1;                          % the dimension of position states
    H   = (1/sqrt(2)) * [1,1;1,-1];         % the Hadamard transformation for a qubit
    qubit_0 = [1; 0];                       % the qubit state |0>
    qubit_1 = [0; 1];                       % the qubit state |1>
    
    c_w = (1/sqrt(2)) * [1, i; i, 1];       % the walking coin state, controlling when to start walking
    c_p = (1/sqrt(2)) * [1, i; i, 1];       % the position coin state, contrlling which direction to walk to
    s_w = [1; 0];                           % the walking state, used to remember whether the walking is started
    s_p = basis(d, n + 1);                  % the position state, which is d-dimension, where d = 2 * n + 1
    
                                            % the state of whole system is: |s_p, c_d, s_w, c_w >
                                            
    M_cw = mkron(eye(d), eye(2), eye(2), H);% the transformation for the walking coin
                                            % M_cw * |s_p, c_d, s_w, c_w> = |s_p, c_d, s_w, H * c_w>
    
    M_cd = mkron(eye(d), H, eye(2), eye(2));% the transformation for the direction coin
                                            % M_cd * |s_p, c_d, s_w, c_w> = |s_p, H * c_d, s_w, c_w>
            
    M_sw = mkron(eye(d), eye(2), ...        % the transformation for the walking state
        ketbra(qreg(0,0), qreg(0,0)) ...
      + ketbra(qreg(1,0), qreg(1,0)) ...
      + ketbra(qreg(1,1), qreg(0,1)) ...
      + ketbra(qreg(1,1), qreg(1,1)));
    
                                            
                                            % M_sw: transformation matrix for the walking state
    % M_sp: transformation matrix for the position state
    %
    
    
    M_cw = kron(eye(d*2*2), H);
    
    
    
    
    M_p = dqwl_postrans(n);                 % the position transformation    
    M   = M_p * M_c;                        % the whole transformation

    s_c = (1/sqrt(2)) * [1, i; i, 1];       % the coin state
    s_p = basis(d, n+1);                    % the position state
    s   = kron(s_p, s_c);                   % the whole state

    for k = 1 : n
        s = M * s;
    end
    s_p = dqwl_measure(s, n);               % measure the position state
end    