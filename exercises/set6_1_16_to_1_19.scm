;; 1.16

(define (square x)
  (* x x))

(define (even? x)
  (= (remainder x 2) 0))

(define (fast-exp b n)
  (define (iter a b n)
    (cond ((= n 1) (* a b))
	  ((even? n)
	   (iter (square a) b (/ n 2)))
	  (else (iter a (* a b) (- n 1))) ))
  (iter b 1 n))

;; 1.17

(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (not-even? x)
  (= (remainder x 2) 1))

(define (mult-recursive a b)
  (cond ((= b 1) a)
	((not-even? b)
	 (+ a (mult-recursive a (- b 1))))
	(else
	 (mult-recursive (double a) (halve b)))))

;; 1.18

(define (mult a b)
  (define (iter a b n)
    (cond ((= b 1) (+ a n))
	  ((even? b)
	   (iter (double a) (halve b) n))
	  (else (iter a (- b 1) (+ n a)))))
  (iter a b 0))

;; 1.19

;; p' = p² + q²
;; q' = 2pq + q²
 
(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
	((even? count)
	 (fib-iter a
		   b
		   (+ (square p) (square q))
		   (+ (* 2 p q) (square q))
		   (/ count 2)))
	(else (fib-iter (+ (* b q) (* a q) (* a p))
			(+ (* b p) (* a q))
			p
			q
			(- count 1)))))
