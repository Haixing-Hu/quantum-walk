%QUBIT  Calculates the column vector representing a qubit.
%
%   QUBIT(b)    Calculates the column vector representing the qubit.
%       b:      the value of the qubit, which should be either 0 or 1.
%       return: a 2-dimension column vector, representing the specified
%               qubit.

%   Copyright 2013, Haixing Hu
%   Department of Computer Science & Technology, Nanjing University, China.
function v = qubit(b)
    if (b == 0) 
        v = [1; 0];
    else
        v = [0; 1];    
    end
end