/*
  It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.

  Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.
*/

  /* Compare some x and y */
  numbersHaveSameDigits(X, Y) :- number_codes(X, Xs), number_codes(Y, Ys), sort(Xs, Xsorted), sort(Ys, Ysorted), Xsorted == Ysorted.

  /* Given some x and a multiplier k, check whether kx has the same digits */
  numberMultHaveSameDigits(X, K) :- Y is X * K, numbersHaveSameDigits(X, Y).

  /* Find for 2x, 3x, 4x, 5x, 6x */
  findSmallestX([], 0).
  findSmallestX([H|T], L) :- 
    numberMultHaveSameDigits(H, 2), 
    numberMultHaveSameDigits(H, 3), 
    numberMultHaveSameDigits(H, 4), 
    numberMultHaveSameDigits(H, 5), 
    numberMultHaveSameDigits(H, 6), 
    L is H, !.
  findSmallestX([H|T], L) :- findSmallestX(T, L).
