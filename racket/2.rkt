#lang typed/racket

(require typed/rackunit)

; Generates Fibonacci sequence up to k
(: fib-seq (-> Integer (Listof Integer)))
(define (fib-seq k)
  (: fib-terms (-> Integer Integer Integer (Listof Integer) (Listof Integer)))
  (define (fib-terms prev cur limit acc)
    (cond
      [(<= (+ prev cur) limit)
       (append (fib-terms cur (+ prev cur) limit acc) (cons (+ prev cur) acc))]
      [else acc]))
  (reverse (fib-terms 0 1 k '())))

; Returns true if number is even
(: is-even (-> Integer Boolean))
(define (is-even n)
  (zero? (modulo n 2)))

; Takes a list of numbers and return the sum
(: sumList (-> (Listof Integer) Integer))
(define (sumList xs)
  (foldl (lambda ([v : Integer] [i : Integer]) (+ v i)) 0 xs))

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