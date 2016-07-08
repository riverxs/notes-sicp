(define (equal? a b)
	(cond ((and (null? a) (null? b)) #t)
		  ((eq? (car a) (car b)) (equal? (cdr a) (cdr b)))
		  ((and (pair? (car a)) (pair? (car b))) (equal? (car a) (car b)))
		  (else #f)))

(equal? '(this is a list) '(this is a list)) ; #t

(equal? '(this is a list) '(this (is a) list)) ; #f

(equal? '(this is a list) '(this a is list)) ; #f
