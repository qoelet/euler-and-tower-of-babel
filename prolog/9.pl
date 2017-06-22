/*
  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

  a^2 + b^2 = c^2
  For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  Find the product abc.
*/

 /* Check ordering */
 chkOrder(A, B, C) :- A < B, B < C.

 /* Check if it's a triplet */
 chkIsTriplet(A, B, C) :-
   A > 0, B > 0, C > 0,
   chkOrder(A, B, C),
   Asq is A ^ 2,
   Bsq is B ^ 2,
   Csq is C ^ 2,
   ABsum is Asq + Bsq,
   ABsum == Csq.

 /* Find the triplet */
 findTriplet(A, B, C, T) :-
   between(0, T, A),
   between(A, T, B),
   between(B, T, C),
   chkOrder(A, B, C),
   chkIsTriplet(A, B, C),
   S is A + B + C,
   S == 1000.

 /* Calculate product */
 productOfTriplet(T) :-
   findTriplet(A, B, C, 500),
   T is A * B * C.
