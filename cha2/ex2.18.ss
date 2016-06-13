; 翻转list
(define (reverse items)
	(define (iter things result)
		(if (null? things)
			result
			(iter (cdr things) (cons (car things) result))))
	(iter items '()))

; test

 (reverse (list 1 2 3 4)) ;(4 3 2 1)



