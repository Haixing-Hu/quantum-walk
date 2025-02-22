%CQWL_INITIAL_STATE Calculate initial state of a continous-time quantum 
%                   walk on a line.   
%
%  CQWL_INITIAL_STATE(n, x) Calculate initial state of a continous-time  
%                        quantum walk on a line.
%       n:          the maximum steps of the quantum walk, that is, 2*n+1
%                   is the dimension of the position state of the system.
%       x:          the initial position of the walker.
%       return:     a (2n+1)-dimension vector representing the probability 
%                   distribution for the walker at each position at the 
%                   begining of the walk.
%   Copyright 2015-2017, Haixing Hu.
%   Department of Computer Science & Technology, 
%   School of Physics,
%   Nanjing University, China.

function s = cqwl_initial_state(n, x)
    s = zeros(2*n+1,1);
    s(n+x+1) = 1;
end