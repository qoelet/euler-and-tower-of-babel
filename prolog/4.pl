/*
  A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
  Find the largest palindrome made from the product of two 3-digit numbers.
*/

  /* check if a number is palindromic? */
  /* use algorithm found on page: http://stackoverflow.com/questions/199184/how-do-i-check-if-a-number-is-a-palindrome */
  isPalindrome(X) :- isPalindromic(X, X, 0).

  isPalindromic(0, N, N).
  isPalindromic(X, Y, Rev) :- 
    X > 0, 
    Dig is mod(X,10), 
    Rev2 is (Rev * 10) + Dig, 
    X2 is floor(X / 10), 
    isPalindromic(X2, Y, Rev2).

  /* this also works, thanks @jkarni */
  isPalindrome2(X) :- number_chars(X, Xs), reverse(Xs, Ys), Xs == Ys.

  /* generate a list of all products of 2 3-digit numbers */
  genProducts([], _, []).
  genProducts([H|T], Y, [S1|L]) :- productsOf(H, Y, Z), S1 = Z, genProducts(T, Y, L). /* we'll need to flatten L before filtering */

  productsOf(_, [], []).
  productsOf(X, [H|T], [P|L]) :- P is X * H, productsOf(X, T, L).

  /* filter for palindromes and take the max? */
  isPalindromes([], []).
  isPalindromes([H|T], [H|L]) :- 
    isPalindrome(H), 
    isPalindromes(T, L).
  isPalindromes([_|T], L) :- 
    isPalindromes(T, L).

/*
?- numlist(100,999,L1), numlist(100,999,L2), genProducts(L1,L2,NestedProducts), flatten(NestedProducts, Products), isPalindromes(Products, P), max_list(P,Pmax).
L1 = L2, L2 = [100, 101, 102, 103, 104, 105, 106, 107, 108|...],
NestedProducts = [[10000, 10100, 10200, 10300, 10400, 10500, 10600, 10700|...], [10100, 10201, 10302, 10403, 10504, 10605, 10706|...], [10200, 10302, 10404, 10506, 10608, 10710|...], [10300, 10403, 10506, 10609, 10712|...], [10400, 10504, 10608, 10712|...], [10500, 10605, 10710|...], [10600, 10706|...], [10700|...], [...|...]|...],
Products = [10000, 10100, 10200, 10300, 10400, 10500, 10600, 10700, 10800|...],
P = [10201, 11211, 12221, 13231, 14241, 15251, 16261, 17271, 18281|...],
Pmax = 906609 .
*/
