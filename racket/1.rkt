#lang racket

(require rackunit)

; Number -> Number
; takes a n and checks if it is a multiple of k
; given: n=9, k=3, expect: t
; given: n=9, k=2, expect: f
(define (is-multiple-of n k)
  (zero? (modulo n k)))

(check-equal? (is-multiple-of 9 3) #t)
(check-equal? (is-multiple-of 9 2) #f)

; List of Number -> Number
; takes a list of numbers and return the sum
; given: '(1 2 3), expect: 6
(define (sumList xs)
  (foldl (lambda (v i) (+ v i)) 0 xs))

(check-equal? (sumList '(1 2 3)) 6)

; List of Number -> List of Number
; takes a list of numbers and return those that are
; a multiple of 3 or 5
; given: '(1 2 3 4 5 6), expect: '(3 5 6)
(define (filter-multiples-of-three-or-five xs)
  (filter (lambda (i) (or (is-multiple-of i 3) (is-multiple-of i 5))) xs))

(check-equal? (filter-multiples-of-three-or-five '(1 2 3 4 5 6)) '(3 5 6))

; Example: < 10
(check-equal? (sumList (filter-multiples-of-three-or-five (range 1 10))) 23)

; Solving...
(sumList (filter-multiples-of-three-or-five (range 1 1000)))