#lang racket

(require rackunit)

; Number -> List of Number
; generates Fibonacci sequence up to k
(define (fib-seq k)
  (define (fib-terms prev cur limit acc)
    (cond
      [(<= (+ prev cur) limit)
       (append (fib-terms cur (+ prev cur) limit acc) (cons (+ prev cur) acc))]
      [else acc]))
  (reverse (fib-terms 0 1 k '())))

; Number -> Boolean
; returns true if number is even
(define (is-even n)
  (zero? (modulo n 2)))

; List of Number -> Number
; takes a list of numbers and return the sum
(define (sumList xs)
  (foldl (lambda (v i) (+ v i)) 0 xs))

(check-equal?
 (fib-seq 10)
 '(1 2 3 5 8))

(check-equal?
 (filter (lambda (i) (is-even i)) (fib-seq 10))
 '(2 8))

(check-equal?
 (sumList (filter (lambda (i) (is-even i)) (fib-seq 10)))
 10)

; Solving
(sumList (filter (lambda (i) (is-even i)) (fib-seq 4000000)))