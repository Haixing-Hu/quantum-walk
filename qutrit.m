%qutrit  Calculates the column vector representing a qutrit (i.e., a 
%        3-states qubit).
%
%   qutrit(b)    Calculates the column vector representing a qutrit (i.e., a 
%                3-states qubit).
%       b:      the value of the qutrit, which should be either 0, 1, or 2.
%       return: a 3-dimension column vector, representing the specified 
%               qutrit.

%   Copyright 2015, Kun Wang
%   Department of Computer Science & Technology, Nanjing University, China.
function v = qutrit(b)
    if (b == 0) 
        v = [1; 0; 0];
    elseif (b == 1)
        v = [0; 1; 0];
    else
        v = [0; 0; 1];    
    end
end