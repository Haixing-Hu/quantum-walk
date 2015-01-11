%BRA Calculate the normalized conjugate transpose of a column vector.
%
%   BRA(v)      Calculate the normalized conjugate transpose of a column, 
%               vector, as described by the Dirac notation "<psi|".           
%       v:      a column vector.
%       return: the normalized conjugate transpose of the input vector.

%   Copyright 2013, Haixing Hu
%   Department of Computer Science & Technology, Nanjing University, China.

function w=bra(v)
   [y,x] = size(v);
   if x > 1,
     w = conj(v);
   else
     w = v';
   end %if
   % normalization
   w = w / sqrt(w * w');
   
   
