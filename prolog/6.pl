/*
  The sum of the squares of the first ten natural numbers is,
  1^2 + 2^2 + ... + 10^2 = 385

  The square of the sum of the first ten natural numbers is,
  (1 + 2 + ... + 10)^2 = 55^2 = 3025

  Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

  Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
*/

  /* we just define a predicate to pass to maplist */
  square(N, Nsq) :- Nsq is N * N.

/*
?- numlist(1, 100, L), maplist(square, L, Lsq), sum_list(Lsq, SumLsq), sum_list(L, SumL), square(SumL, SqSumL), R is SqSumL - SumLsq.
L = [1, 2, 3, 4, 5, 6, 7, 8, 9|...],
Lsq = [1, 4, 9, 16, 25, 36, 49, 64, 81|...],
SumLsq = 338350,
SumL = 5050,
SqSumL = 25502500,
R = 25164150.
*/
