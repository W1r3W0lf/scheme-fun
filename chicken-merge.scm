
(import (chicken random))

;; Sorts a list of numbers
(define (merge-sort lst)
  (define (combine list1 list2)
	;; combine two sorted lists into one sorted list
	(cond ((= 0 (length list1))
		   list2)
		  ((= 0 (length list2))
		   list1)
		  (else
			(if (< (car list1) (car list2))
				(cons (car list1) (combine (cdr list1) list2))
				(cons (car list2) (combine list1 (cdr list2)))))))
  (define (merge lists)
	;; Pair off lists and apply merge to them
	(cond ((= 1 (length lists))
		   lists)
		  ((= 2 (length lists))
		   (list (combine (car lists) (cadr lists))))
		  (else
			(cons (combine (car lists) (cadr lists)) (merge (cddr lists))))))
  (define (merge-loop lists)
	;; Itterate until there is just one list.
	(if (= 1 (length lists))
		(car lists)
		(merge-loop (merge lists))))
  (merge-loop (map list lst)))

(define lists '((5 4 7 3 9 7)
				(-1 0 26 1 2 4 11)
				( 876 1 55 387 389 476 467 375)
				))

(define (repeate x y)
  (if (= y 1)
	  (list x)
	  (cons x (repeate x (- y 1)))
	  )
  )

(define (display-n x)
  (begin (display x)
		 (display "\n")))

(map (lambda (lst) (begin (display-n lst) (display-n (merge-sort lst)))) lists)

(define rand-list (map pseudo-random-integer (repeate 99999 100000)))

(display-n rand-list)
(display-n (merge-sort rand-list))

