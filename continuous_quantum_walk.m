
%CONTINUOUS_QUANTUM_WALK Calculates the state of the walker of a 
%                   continuous-time quantum walks on a graph at a specified 
%                   time point.
%
%  CONTINUOUS_QUANTUM_WALK(t, A, psi0) Calculates the state of the walker 
%                   of a continuous-time quantum walks on a graph at a
%                   specified time point.
%       t:          a real number, representing a time point.
%       A:          a n*n matrix, representing the adjacency matrix of the 
%                   graph.
%       psi_0:      a n-dimensional vector, representing the initial state 
%                   of the quantum walk.
%       return:     a n-dimensional vector, representing the state at the
%                   time t.

%   Copyright 2014, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function psi_t = continuous_quantum_walk(t, A, psi_0)
    % |\psi(t)> = e^{iAt}|\psi_0>
    psi_t = expm(t * sqrt(-1) * A) * psi_0;
end