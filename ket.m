%KET  Transforms a row-vector into a normalized column vector.
%
%   KET(v)      Transforms a row vector into a normalized column vector, as 
%               described by the Dirac notation "|psi>".
%       v:      a row vector.
%       return: the corresponding normalized column vector.

%   Copyright 2013, Haixing Hu
%   Department of Computer Science & Technology, Nanjing University, China.

function w=ket(v)
   [y,x]=size(v);
   if x > 1,
     w = v.';
   else
     w = v;
   end 
   w = w / sqrt(w' * w);
   
   
