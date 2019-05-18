;; There are problems with most of these exercises due to the increased speed of
;; computers. Therefore, one should not try to solve the exercises as they are expressed
;; in the book. Rather, should try to understand the ideas presented in the sub-chapter.

;; Such as probabilistic algorithms and time-analysis.



(define (square x) (* x x)) 
  
 (define (smallest-divisor n) 
   (find-divisor n 2)) 
  
 (define (find-divisor n test-divisor) 
   (cond ((> (square test-divisor) n) n) 
         ((divides? test-divisor n) test-divisor) 
         (else (find-divisor n (next test-divisor))))) 
  
 (define (divides? a b) 
   (= (remainder b a) 0)) 
  
 (define (prime? n) 
   (= n (smallest-divisor n))) 

;; Exercise 1.21

;;(find-smaller-divisor 199)    ;; returns 199
;;(find-smaller-divisor 1999)   ;; returns 1999
;;(find-smaller-divisor 19999)  ;; returns 7

;; Exercise 1.22

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 12)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes first last) 
  (define (search-iter cur last) 
    (if (<= cur last) (timed-prime-test cur)) 
    (if (<= cur last) (search-iter (+ cur 2) last))) 
  (search-iter (if (even? first) (+ first 1) first) 
	       (if (even? last) (- last 1) last))) 

;; Exercise 1.23

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

;; The expectation that the runtime will halve is wrong. The ratio is closer to 1.5
;; It is different from 2 because of the if test that needs to be realized to each
;; value

;; Exercise 1.24

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder
	  (square (expmod base (/ exp 2) m))
	  m))
	(else
	 (remainder
	  (* base (expmod base (- exp 1) m))
	  m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))

;; Exercise 1.25

;; She is correct in the sense that the result would be correct for smaller
;; numbers.
;; However, this change would create much larger numbers. Something that should
;; require more computational resources.

;; In other words, the original process reduces the number to be smaller than m
;; everytime it invokes remainder.
;; The modified procedure, on the other side, first computes the whole number,
;; and then invokes a single remainder.

;; If we take into consideration the imprecise nature of dealing with very
;; large numbers, the results of the new procedure would tend to get more wrong
;; as the number increases.

;; Exercise 1.26

;; Due to how the scheme interpreter works, invoking expmod twice, even it having
;; the same result, would take twice as long.

;; The procedure is now akim to a tree-recursion.
;; The exp halves each step. But each step is invoked twice.
;; Therefore, the process is now of O(n).

;; Exercise 1.27

(define (charmichael? n)
  (charmiter 2 n))

(define (charmiter a n)
  (cond ((= a n) #t)
	((congruent? a n)
	 (charmiter (+ a 1) n))
	(else #f)))

(define (congruent? a n)
  (if (= (remainder (fast-exp a n) n) a)
      #t
      #f))

(define (fast-exp base n)
  (cond ((= n 1) base)
	((even? n)
	 (square (fast-exp base (/ n 2))))
	(else
	 (* base (fast-exp base (- n 1))))))

;; If you test the givens numbers: 561; 1105; 6601;
;; they will be false positives


;; Exercise 1.28

(define (miller-rabin-test p)
  (define (try-it a p)
    (= (miro-mod a (- p 1) p) 1))
  (try-it (+ 2 (random (- p 1))) p))

(define (miro-mod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder-square-check (miro-mod base (/ exp 2) m) m))
	(else
	 (* base (miro-mod base (- exp 1) m)))))

(define (remainder-square-check x m)
  (if (and (not (= x (- m 1)))
	   (= (remainder (square x) m) 1))
      0
      (remainder (square x) m)))
