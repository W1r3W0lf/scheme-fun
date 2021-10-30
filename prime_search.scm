
;;; Chez Scheme

(define (largest-factor x)
  (do ((y (floor (sqrt x)) (- y 1)))
      ((= 0 (mod x y)) y)))

(define (is-prime x)
  (= 1 (largest-factor x)))

(define (first-n-primes n)
  (do ((x 2 (+ x 1)) (pl '()))
      ((= n (length pl)) pl)
    (if (is-prime x)
        (set! pl (append pl (list x))))))



(define (pi-talor terms)
  (do ((pi 0)(n 1 (+ n 1)))
      ((= n terms) pi)
    (set! pi
      (+ pi (* (expt -1 (+ n 1))(/ 4 (- (* n 2) 1))))
      )))

(define (ratnum->float num)
  (expt num 1.0))

(define (test-n-numbers n)
  (if (= n 1)
      #t
      (begin
        (display n)
        (if (is-prime n)
            (display " is Prime\n")
            (display " not\n"))
        (test-n-numbers (- n 1)))))


(display (first-n-primes 10000))
