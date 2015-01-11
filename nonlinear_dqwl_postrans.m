%NONLINEAR_DQWL_POSTRANS  Calculates the position transformation of a 
%                        non-linear discrete quantum on a line with two coins.
%
%   NONLINEAR_DQWL_POSTRANS(n) Calculates the position transformation of 
%                    n-steps non-linear discrete quantum walk on a line with two coins.
%       n:           the number of steps of the quantum walk.
%       return:      a 4d * 4d matrix representing the position 
%                    transformation matrix of quantum walk system, where 
%                    d = 2 * n + 1 is the dimension of the position state.

%   Copyright 2013, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function M_p = nonlinear_dqwl_postrans(n)  
    disp('INFO: Calculating the position transformation matrix...');
    c_0 = qubit(0);                         % the coin state |0>
    c_1 = qubit(1);                         % the coin state |1>
    d = 2 * n + 1;                          % the dimension of position state
    M_p = zeros(4*d);                       % calculate the position transformation
    if n < 1
        disp('ERROR: number of steps must be greater than one');
    else 
        % M_p = \sum_{k=1}^{n-1}(|k-1,0,0> <k,0,0| + |k+1,1,0> <k,1,0|
        %                       +|k-1,0,1> <k,0,1| + |k+1,1,1> <k,1,1|)
        %     + \sum_{k=n+3}^{d}(|k-1,0,0> <k,0,0| + |k+1,1,0> <k,1,0|
        %                       +|k-1,0,1> <k,0,1| + |k+1,1,1> <k,1,1|)
        %     + (|n-1,0,0> <n,0,0| + |n,0,0> <n,1,0| +|n-1,0,1> <n,0,1| + |n+1,1,1> <n,1,1|)
        %     + (|n+2,1,0> <n+2,0,0| + |n+3,1,0> <n+2,1,0| +|n+1,0,1> <n+2,0,1| + |n+3,1,1> <n+2,1,1|)        
        %     + (|n+1,0,0> <n+1,0,0| + |n+1,0,0> <n+1,1,0| +|n,0,1> <n+1,0,1| + |n+2,1,1> <n+1,1,1|)
        for k = 1 : n-1                           
            p_o = basis(d, k);                  % the current position state |k>
            p_l = basis(d, k - 1);              % the position state |k-1>
            p_r = basis(d, k + 1);              % the position state |k+1> 
            M_p = M_p + ketbra(mkron(p_l, c_0, c_0), mkron(p_o, c_0, c_0));
            M_p = M_p + ketbra(mkron(p_r, c_1, c_0), mkron(p_o, c_1, c_0));
            M_p = M_p + ketbra(mkron(p_l, c_0, c_1), mkron(p_o, c_0, c_1));
            M_p = M_p + ketbra(mkron(p_r, c_1, c_1), mkron(p_o, c_1, c_1));
        end 
        for k = n+3 : d                           
            p_o = basis(d, k);                  % the current position state |k>
            p_l = basis(d, k - 1);              % the position state |k-1>
            p_r = basis(d, k + 1);              % the position state |k+1>             
            M_p = M_p + ketbra(mkron(p_l, c_0, c_0), mkron(p_o, c_0, c_0));
            M_p = M_p + ketbra(mkron(p_r, c_1, c_0), mkron(p_o, c_1, c_0));
            M_p = M_p + ketbra(mkron(p_l, c_0, c_1), mkron(p_o, c_0, c_1));
            M_p = M_p + ketbra(mkron(p_r, c_1, c_1), mkron(p_o, c_1, c_1));
        end
                         
        % for k = n, i.e., the coordinate of -1
        p_o = basis(d, n);
        p_l = basis(d, n - 1);
        p_r = basis(d, n + 1);
        M_p = M_p + ketbra(mkron(p_l, c_0, c_0), mkron(p_o, c_0, c_0));
        M_p = M_p + ketbra(mkron(p_o, c_0, c_0), mkron(p_o, c_1, c_0));
        M_p = M_p + ketbra(mkron(p_l, c_0, c_1), mkron(p_o, c_0, c_1));
        M_p = M_p + ketbra(mkron(p_r, c_1, c_1), mkron(p_o, c_1, c_1));
        
        % for k = n + 2, i.e., the coordinate of 1
        p_o = basis(d, n + 2);
        p_l = basis(d, n + 1);
        p_r = basis(d, n + 3);
        M_p = M_p + ketbra(mkron(p_o, c_1, c_0), mkron(p_o, c_0, c_0));
        M_p = M_p + ketbra(mkron(p_r, c_1, c_0), mkron(p_o, c_1, c_0));
        M_p = M_p + ketbra(mkron(p_l, c_0, c_1), mkron(p_o, c_0, c_1));
        M_p = M_p + ketbra(mkron(p_r, c_1, c_1), mkron(p_o, c_1, c_1));
        
        % for k = n + 1, i.e., the coordinate of 0
        p_o = basis(d, n + 1);
        p_l = basis(d, n);
        p_r = basis(d, n + 2);
        M_p = M_p + ketbra(mkron(p_o, c_0, c_0), mkron(p_o, c_0, c_0));
        M_p = M_p + ketbra(mkron(p_o, c_1, c_0), mkron(p_o, c_1, c_0));
        M_p = M_p + ketbra(mkron(p_l, c_0, c_1), mkron(p_o, c_0, c_1));
        M_p = M_p + ketbra(mkron(p_r, c_1, c_1), mkron(p_o, c_1, c_1));        
    end
end       