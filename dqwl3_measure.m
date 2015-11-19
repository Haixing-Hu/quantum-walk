%DQWL3_MEASURE  Measure the position state of a 3-states discrete-time 
%               quantum walk on a line.
%
%   DQWL3_MEASURE(s, n) Measure the position state of a 3-states discrete-time 
%                       quantum walk on a line.
%       s:             the whole state of the quantum walk system, which is
%                      a 3*(2*n+1)-dimesional vector.
%       n:             the number of steps of the quantum walk.
%       return:        a (2*n+1)-dimensional vector representing the 
%                      probability vector of the position.

%   Copyright 2015, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function r = dqwl3_measure(s, n)
    d = 2 * n + 1;
    r = zeros(d, 1);
    for i = 1 : d
        r(i) = abs(s(3 * i - 2)).^2 + abs(s(3 * i - 1)).^2 + abs(s(3 * i)).^2;
    end
end    