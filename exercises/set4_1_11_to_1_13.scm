;; Exercise 1.11
;; recursive way:
(define (f-rec n)
  (if (< n 3)
      n
      (+ (f-rec (- n 1)) (* 2 (f-rec (- n 2))) (* 3 (f-rec (- n 3))))))

;; iterative way

  (define (iter-f a b c count)
    (if (= count 0)
	(+ (* 3 a) (* 2 b) c)
	(iter-f b c (+ (* 3 a) (* 2 b) c) (- count 1))))

(define (f-iter n)
  (if (< n 3)
      n
      (iter-f 0 1 2 (- n 3))))

;; exercise 1.12 pascal-triangle

(define (pascal row collum)
  (if (or (= collum 1) (= collum row))
      1
      (+ (pascal (- row 1) (- collum 1))
	 (pascal (- row 1) collum))))

;; exercise 1.13

;; kinda too complicated to show the full resolution here.

