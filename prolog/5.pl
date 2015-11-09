/*
  2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
  What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
*/

  
  primesUpToK(K, L) :- findPrimes(K, 2, L).

  findPrimes(0, _, []).
  findPrimes(K, P, [P|L]) :- P =< K, isPrime(P), Pnext is P + 1, findPrimes(K, Pnext, L).
  findPrimes(K, P, L) :- P > K, findPrimes(0, P, L).
  findPrimes(K, P, L) :- Pnext is P + 1, findPrimes(K, Pnext, L).
  
  findExponent(K, P, E) :- E is floor(log(K) / log(P)).
  
  findExponents(_, [], []).
  findExponents(K, [P|T], [E|L]) :- isPrime(P), findExponent(K, P, E), findExponents(K, T, L).

  findN(_, [], [], 1).
  findN(K, [P|T], [E|X], N1) :- Z is P ^ E, findN(K, T, X, N), N1 is Z * N. 

  /* reused from 3.pl */
  isPrime(N) :- checkPrime(N, N).

  checkPrime(_, 1).
  checkPrime(N, N) :- M is N - 1, checkPrime(N,M).
  checkPrime(N, M) :- mod(N,M) =\= 0, Mnext is M - 1, checkPrime(N, Mnext). 

/*
?- K is 20, primesUpToK(K, Ps), findExponents(K, Ps, Es), findN(K, Ps, Es, N).
K = 20,
Ps = [2, 3, 5, 7, 11, 13, 17, 19],
Es = [4, 2, 1, 1, 1, 1, 1, 1],
N = 232792560 .
*/
