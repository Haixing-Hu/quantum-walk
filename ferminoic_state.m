%FERMINOIC_MEASURE  Measure the position state of a discrete-time quantum walk
%              on a line.
%
%   FERMINOIC_MEASURE(s1, s2) Calculate the ferminoic state of two dependent
%                       state.
%       s1:            the first state, which is a m-dimensional vector.
%       s2:            the second state, which is a m-dimensional vector.
%       return:        a 2m-dimensional vector representing the ferminoic
%                      state of the two particles.
%   Copyright 2017, Haixing Hu.
%   School of Physics,
%   Nanjing University, China.
function r = ferminoic_state(s1, s2)
    n = size(s1);
    assert(n(2) == 1, 's1 must be a state vector');
    m = size(s2);
    assert(m(2) == 1, 's2 must be a state vector');
    assert(n(1) == m(1), 's1 and s2 must the state vectors of the same dimension.');
    d = n(1);
    r = zeros(d, d);
    for x = 1 : d
        for y = 1 : d
            r(x,y) = 1/sqrt(2) * (s1(x)*s2(y) - s1(y) * s2(x));
        end
    end
end