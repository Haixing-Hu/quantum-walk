%QREG  Calculates the column vector representing the quantum register.
%
%   QREG(b1, b2, ...)   Calculates the column vector representing the 
%                       quantum state of the quantum register.
%   b1, b2, ...:        the value of bits of the quantum register.
%       return:         a 2^n-dimension column vector, representing the 
%                       specified quantum state of the quantum register,
%                       where n is the number of qubits.

%   Copyright 2013, Haixing Hu
%   Department of Computer Science & Technology, Nanjing University, China.
function s = qreg(b1, varargin)
    s = qubit(b1);
    for i = 1 : length(varargin)
        b_i = varargin{i};
        s = kron(s, qubit(b_i));
    end
end