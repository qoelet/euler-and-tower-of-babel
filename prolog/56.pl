/*
  A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^100 is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.
  Considering natural numbers of the form, a^b, where a, b < 100, what is the maximum digital sum?
*/
  :- ['8.pl'].

  /* a, b < 100, generate a list of a^b */
  lstSq([], _, _, []).
  lstSq([H|T], [A|B], R, [Hsq|L]) :- Hsq is H ^ A, lstSq([H|T], B, R, L).
  lstSq([H|T], [], R, L) :- lstSq(T, R, R, L).

  /* from the list of a^b, convert to chars then to digits */
  /* given some L from lstSq, call maplist(number_chars, L, Lc), then maplist(chars2Num, Lc, Ln) */

  sumFoldR([], 0).
  sumFoldR([H|T], Hs) :- sumFoldR(T, Z), Hs is H + Z.

/*
?- numlist(1, 99, L), lstSq(L, L, L, Lsq), maplist(number_chars, Lsq, Lc), maplist(chars2Nums, Lc, Ln), maplist(sumFoldR, Ln, Ldsum), max_list(Ldsum, Maxdsum).
L = [1, 2, 3, 4, 5, 6, 7, 8, 9|...],
Lsq = [1, 1, 1, 1, 1, 1, 1, 1, 1|...],
Lc = [['1'], ['1'], ['1'], ['1'], ['1'], ['1'], ['1'], ['1'], [...]|...],
Ln = [[1], [1], [1], [1], [1], [1], [1], [1], [...]|...],
Ldsum = [1, 1, 1, 1, 1, 1, 1, 1, 1|...],
Maxdsum = 972 .
*/
