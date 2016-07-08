(define (equ? x y)
	(if (eq? (car x) (car y))
		(if (and (null? (cdr x)) (null? (cdr y)))
			#t
			(equ? (cdr x) (cdr y)))
		#f))

;test

(define n1 (cons 'com (cons 'rect (cons 3 (cons 4 '())))))

(define n2 (cons 'com (cons 'rect (cons 3 (cons 4 '())))))

(define n3 (cons 'comp (cons 'rect (cons 3 (cons 4 '())))))

(equ? n1 n2) ;#t
(equ? n1 n3) ;#f


