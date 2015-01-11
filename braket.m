%BRAKET  Calculates the inner product of two vectors.
%
%   BRAKET(v1,v2) Calculates the inner product of v1 and v2, i.e.,
%                 calculates the <v1|v2> in the Dirac's notation.
%     v1:         a column vector, which do not have to be normalized,
%                 since the function will normalize it before calculation.
%     v2:         another column vector with the same dimension as v1, 
%                 which do not have to be normalized, since the function
%                 will normalize it before calculation.
%     return:     the inner product of v1 and v2, which is a scalar.

%   Copyright 2013, Haixing Hu
%   Department of Computer Science & Technology, Nanjing University, China.

function b = braket(v1, v2)
    b = bra(v1) * ket(v2);
end   