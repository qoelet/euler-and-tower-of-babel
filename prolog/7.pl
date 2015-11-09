/*
  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
  What is the 10 001st prime number?
*/

  /* a more efficient isPrime */
  isPrime(N) :- checkPrime(N, _).

  checkPrime(N, P) :- N =:= 2, P is N.
  checkPrime(N, P) :- N =\= 1, N < 9, !, mod(N, 2) =\= 0, P is N.
  checkPrime(N, P) :- N =\= 1, mod(N, 2) =\= 0, mod(N, 3) =\= 0, R is round(sqrt(N)), R >= 5, !, loopCheckPrime(5, R, N, isP), P is N.
  checkPrime(N, P) :- N =\= 1, mod(N, 2) =\= 0, mod(N, 3) =\= 0, P is N.

  loopCheckPrime(F, R, _, _) :- F > R, !.
  loopCheckPrime(F, R, N, P) :- F =< R, mod(N, F) =\= 0, Fnext is F + 6, F2 is F + 2, mod(N, F2) =\= 0, loopCheckPrime(Fnext, R, N, P).


  /* we'll want some function with an accumulator tracking Nth prime */
  findNthPrime(1, 2).
  findNthPrime(N, P) :- loopPrimes(N, 1, 1, P), !.

  loopPrimes(L, C, T, P) :- isPrime(T), C2 is C + 1, C2 =:= L, P is T.
  loopPrimes(L, C, T, P) :- isPrime(T), C2 is C + 1, T2 is T + 2, loopPrimes(L, C2, T2, P).
  loopPrimes(L, C, T, P) :- T2 is T + 2, loopPrimes(L, C, T2, P).

/*
?- findNthPrime(10001, P).
P = 104743.
*/
