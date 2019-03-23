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
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))
