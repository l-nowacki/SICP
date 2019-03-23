;; Exercise 1.9

(define (inc x)
  (+ x 1))

(define (dec x)
  (- x 1))

(define (rec-add a b)
  (if (= a 0) b (inc (rec-add (dec a) b)) ))

(define (iter-add a b)
  (if (= a 0) b (iter-add (dec a) (inc b)) ))

;; rec-add is a recursive process since there is something to be done in the same operation
;; of the function call

;; (rec-add 4 5)
;; (inc (rec-add (dec 4) 5))
;; (inc (inc (rec-add (dec 3) 5)))
;; (inc (inc (inc (rec-add (dec 2) 5))))
;; (inc (inc (inc (inc (rec-add (dec 1) 5)))))
;; (inc (inc (inc (inc (inc (rec-add 0 5))))))
;; (inc (inc (inc (inc (inc 5)))))
;; (inc (inc (inc (inc 6))))
;; (inc (inc (inc 6)))
;; (inc (inc 7))
;; (inc 8)
;; 9

;; iter-add is a iterative process since all the information required to finish the process is containde
;; in the process itself

;; (iter-add 4 5)
;; (iter-add 3 6)
;; (iter-add 2 7)
;; (iter-add 1 8)
;; (iter-add 0 9)
;; 9

;; Exercise 1.10

(define (A x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1) (A x (- y 1))))))


(define (f n) (A 0 n))

;; fn => 2n

(define (g n) (A 1 n))

;; gn => 2^n

(define (h n) (A 2 n))

;; hn => 2^2...(n-1 times)
