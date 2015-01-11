
%PERIODICAL_LINE_SEGMENT Calculates the adjancy matirx of a periodical line
%                   segment.
%
%  PERIODICAL_LINE_SEGMENT(n)Calculates the adjancy matirx of a periodical 
%                   line segment.
%       n:          the number of vertexes of the line segment.
%       return:     a n*n matrix representing the adjancency matrix of the
%                   periodical line segment.

%   Copyright 2014, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function A = periodical_line_segment(n)
    if (n < 2) 
        error('ERROR: number of vertexes must be at least 2.');
    end
    disp('INFO: Generating the adjancency matrix of a periodical line segment ...');
    A = zeros(n, n);
    for v = 1 : n - 1
       % w(v, v+1) = w(v+1, v) = \sqrt{v(n-v)}
       A(v, v + 1) = sqrt(v * (n - v));
       A(v + 1, v) = A(v, v + 1);
    end
end