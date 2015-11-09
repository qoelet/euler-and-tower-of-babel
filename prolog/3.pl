/*
  The prime factors of 13195 are 5, 7, 13 and 29.
  What is the largest prime factor of the number 600851475143 ?
*/

  /* test is number is prime */

  isPrime(N) :- checkPrime(N, N).
  
  checkPrime(_, 1).
  checkPrime(N, N) :- M is N - 1, checkPrime(N,M).
  checkPrime(N, M) :- mod(N,M) =\= 0, Mnext is M - 1, checkPrime(N, Mnext). 

  oddTerms([], []).
  oddTerms([H|T], [H|L]) :- mod(H,2) =\= 0, oddTerms(T, L).
  oddTerms([_|T], L) :- oddTerms(T,L).

  /* find the largest prime factor of a given N */
  /* P should be the largest prime < sqrt(N) */
  
  primeFactors(_, [], []).
  primeFactors(N, [H|T], [H|L]) :- 
    mod(N,H) =:= 0,
    isPrime(H),
    primeFactors(N, T, L).
  primeFactors(N, [_|T], L) :- primeFactors(N, T, L).

/*
?- N is 600851475143, M is round(sqrt(N)), numlist(1,M,L), oddTerms(L, O), primeFactors(N, O, Pf), max_list(Pf, LPf).
N = 600851475143,
M = 775146,
L = [1, 2, 3, 4, 5, 6, 7, 8, 9|...],
O = [1, 3, 5, 7, 9, 11, 13, 15, 17|...],
Pf = [1, 71, 839, 1471, 6857],
LPf = 6857 .
*/
