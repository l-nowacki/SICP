;; 1.20

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; In normal order evaluation 18 remainder operations are performed
;; The if procedure (= b 0) needs to be evaluated 14 times in order
;; to return a
;; After that there are only 4 evaluations

;; In applicative order evaluation, 4 remainder operations are performed
