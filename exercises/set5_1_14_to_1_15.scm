;; Exercise 1.14
;;							(11 5)
;;							(11 4)          (-39 5)
;;						(11 3)	(-14 4)
;;					(11 2)	    (1 3)   
;;			(11 1)	    (6 2)   (1 2)   (-9 3)
;;		(11 0)	(10 1)  (6 1)	(1 2)
;;		(10 0)	(9 1)     1   (1 1) (- 4 2)	
;;		(9 0)	(8 1)
;;		(8 0)	(7 1)
;;		(7 0)	(6 1)
;;		(6 0)	(5 1)
;;		(5 0)	(4 1)
;;		(4 0)	(3 1)
;;		(3 0)	(2 1)
;;		(2 0)	(1 1)
;;		(1 0)   (0 1)
;;		   	  1
;;
;;              The number of steps is proportianal to n
;;              The growth of the space is proportional

;; (cc n 1) => O(n)
;; (cc n 2) =>

;; Exercise 1.15

(define (cube x)
  (* x x x))

(define (p x)
  (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (<= (abs angle) 0.1)
      angle
      (p (sine (/ angle 3.0)))))

;; a

(define (<= a b)
  (not (> a b)))

(define (>= a b)
  (not (< a b)))

;; The amount of times the p will applied is equal to
;; amount of times you need to divide the angle by 3
;; to get the angle to be smaller or equal to 0.1.
;; Therefore the procedure helper should suffice in order
;; to discover the amount of times p is applied.
(define (helper n)
  (define (iter n count)
    (if (<= n 0.1)
	count
	(iter (/ n 3) (+ count 1))))
  (iter n 0))

;; (helper 12.15) gives 5 as a result. Hence p is applied 5 times.

;; b

;; The order of growth in space and number of steps (as a function of a) is
;; proportional to log_3(* 10 a)
;; This happens because the amount of steps necessary to return the final
;; value of the function is proportional to the amount of times needed to
;; divide a by 3 to get a value smaller or equal to 0.1



