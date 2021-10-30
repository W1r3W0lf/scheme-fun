
;; Sorts a list of numbers
(define (merge-sort my-list)
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
  (merge-loop (map list my-list)))

(define lists '((5 4 7 3 9 7)
				(-1 0 26 1 2 4 11)
				( 876 1 55 387 389 476 467 375)
				))

(define (display-n x)
  (begin (display x)
		 (display "\n")))

(map (lambda (ls) (begin (display-n ls) (display-n (merge-sort ls)))) lists)


