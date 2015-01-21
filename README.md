# quantum-walk
The matlab simulator of quantum walks.


## Descriptions of Programs

* `basis(n,i)`: Calculates the i-th standard basis of a n-dimension vector.
  * `n`:      the dimension of vectors.
  * `i`:      the i-th standard basis to be calculated.
  * return: a n-dimension vector representing the i-th standard basis of the n-dimension vector space.
* `bra(v)`: Calculate the normalized conjugate transpose of a column, vector, as described by the Dirac notation <\psi|.
  * `v`:      a column vector.
  * return: the normalized conjugate transpose of the input vector.