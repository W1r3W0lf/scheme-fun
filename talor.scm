
(define (fac x)
  (if (= x 0)
	  1
	  (* x (fac (- x 1)))))

(define (sum x)
  (apply + x))

(define (n-list n)
  (if (= n 0)
	  (list 0)
	  (cons n (n-list (- n 1)))))

(define (alternate x)
  (if (= 0 (modulo x 2))
	  -1
	  1))

(define (talor-series fn)
  (lambda (steps)
	(sum (map fn (n-list steps)))))

(define e-talor (talor-series (lambda (x) (/ 1 (fac x)))))

(define pi-talor (talor-series 
				   (lambda (n) (* (alternate n) (/ 4 (- (* n 2) 1))))))

(display (+ 0.0 (e-talor 100)))
(display "\n")
