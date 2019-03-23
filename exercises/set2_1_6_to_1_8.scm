;; From Example Newtons Square Root Method

(define (sqrt-iter guess x)
  (if (new-good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (test x)
  (abs (- x (square (sqrt x)))))

;; Exercise 1.6

;;When Alyssa attempts to use the new-if program to write square-roots
;;the program never halts. This happens because - if - is a special clause
;;that firsts evaluates the predicate, then the then-clause or else-clause.
;;While cond evaluates all clauses.

;; Exercise 1.7

;; Statements to be explained

;; I the good-enough? test will not be very effective for finding the root of very small
;; numbers

;; II In real computer arithmetic operations are performed with limited precision
;; this makes our test very inedequate for very large numbers

;; Show examples showing how the test fails for very small and large numbers.

;; Design a different good-enough? procedure that watches how a guess changes from
;; one iteration to the next, and to stop when the change is a very small fraction
;; of the guess.
 
;; Does this works better for small and large numbers?

(define test1 (test 10))
(define test2 (test 1))
(define test3 (test 0.1))
(define test4 (test 0.01))
(define test5 (test 0.001))
(define test6 (test 0.0001))

;; According to the results of these tests
;; the smaller the number, the bigger the error rate
;; and also the bigger the rate of the error to the number

(define testl1 (test 100))
(define testl2 (test 1000))
(define testl3 (test 10000))
(define testl4 (test 100000))
(define testl5 (test 10000000))

;; and in case of larger numbers the best guess will not be in a 0.001 error rate of the result
;; resulting in an extremally long or infinite loop based on the limited arithmetic capabilities of
;; a computer

;; new-good-enough predicate

(define (new-good-enough? guess x)
  (if (< (abs (- guess (improve guess x))) (/ x ratio))
      #t
      #f))

(define ratio 10000)

;; and this new-good-enough? does work better for small
;; and large numbers. Making the tests again. The results
;; are smaller and smaller. In accord with the size of x.

;; Exercise 1.8

(define (cube x)
  (* x x x))

(define (cub-iter guess x)
  (if (cube-enough? guess x)
      guess
      (cub-iter (cub-improve guess x) x)))

(define (cube-enough? guess x)
  (if (< (abs (- (cube guess) x)) 0.0001)
      #t
      #f))

(define (cub-improve guess x)
  (/ (+ (* 2 guess) (/ x (square guess))) 3))

(define (cube-root x)
  (cub-iter 1.0 x))
