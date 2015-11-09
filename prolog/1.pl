/* 
  project euler q1

  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
  Find the sum of all the multiples of 3 or 5 below 1000.
*/

  sumM3or5([H|T], L) :- (mod(H,3) =:= 0; mod(H,5) =:= 0), sumM3or5(T, L1), L is H + L1. 
  sumM3or5([_|T], L) :- mod(H,3) \= 0, mod(H,5) \= 0, sumM3or5(T, L).
  sumM3or5([], 0).

/*
?- numlist(1,999,L), sumM3or5(L, Y).
L = [1, 2, 3, 4, 5, 6, 7, 8, 9|...],
Y = 233168 .
*/
