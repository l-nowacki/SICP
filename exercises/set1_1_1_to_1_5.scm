;; Exercise 1.1

;; Simple-Evaluations

;; Exercise 1.2

(/ (+ 5 4
      (- 2
	 (- 3
	    (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

;; Exercise 1.3

(define (square x)
  (* x x))

;; since in the exercise it's undefined what to do in case all the number are equal
;; the else clause is defined as the sum of the squares of any argument in that case
(define (square-of-two a b c)
  (cond ((and (> a c) (> b c)) (+ (square a) (square b)))
	((and (> a b) (> c b)) (+ (square a) (square c)))
	((and (< a c) (> b a)) (+ (square c) (square b)))
	(else (+ (square a) (square a))) ))

;; Exercise 1.4

(define (a-plus-abs-b a b)
  ((if (> b 0)
       +
       -)
   a b))

;; this functions takes two arguments - a and b.
;; in case b is positive the function calls
;; (+ a b)
;; else the function calls
;; (- a b)

;; Exercise 1.5

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

;; (test 0 (p))

;; In an interpreter that uses applicative-order evaluation the test
;; will never halt. Because the second argument of test in lost in
;; an identity evaluation loop. p calls p.

;; In an interpreter that uses normal-order evaluation the test
;; will halt. And it will return 0. Because if is a special form.


	    
