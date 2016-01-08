/*
  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.
*/

  /* a more efficient isPrime */
  isPrime(N) :- checkPrime(N, _).

  checkPrime(N, P) :- N =:= 2, P is N.
  checkPrime(N, P) :- N =\= 1, N < 9, !, mod(N, 2) =\= 0, P is N.
  checkPrime(N, P) :- N =\= 1, mod(N, 2) =\= 0, mod(N, 3) =\= 0, R is round(sqrt(N)), R >= 5, !, loopCheckPrime(5, R, N, isP), P is N.
  checkPrime(N, P) :- N =\= 1, mod(N, 2) =\= 0, mod(N, 3) =\= 0, P is N.

  loopCheckPrime(F, R, _, _) :- F > R, !.
  loopCheckPrime(F, R, N, P) :- F =< R, mod(N, F) =\= 0, Fnext is F + 6, F2 is F + 2, mod(N, F2) =\= 0, loopCheckPrime(Fnext, R, N, P).

  /* sum list */
  sumTerms([], 0).
  sumTerms([H|T], L) :- sumTerms(T, L1), L is H + L1.

  primeNumbers([], []).
  primeNumbers([H|T], [H|L]) :-
    isPrime(H),
    primeNumbers(T, L).
  primeNumbers([_|T], L) :- primeNumbers(T, L).

/*
?- numlist(2, 2000000, L), primeNumbers(L, P), sumTerms(P, S).
L = [2, 3, 4, 5, 6, 7, 8, 9, 10|...],
P = [2, 3, 5, 7, 11, 13, 17, 19, 23|...],
S = ...
*/
