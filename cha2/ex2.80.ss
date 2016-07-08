(define (=zero? x)
	(if (number? (car x))
		(if (and (= (car x) 0) (or (null? (cdr x)) (= (cadr x) 0)))
			#t
			#f)
		(=zero? (cdr x))))


;test

(define n1 (cons 'com (cons 'rect (cons 0 (cons 0 '())))))
(define n2 (cons 'com (cons 'rect (cons 3 (cons 0 '())))))



(define n3 (cons 0 '()))
(define n4 (cons 3 '()))

(=zero? n1) ;t
(=zero? n2) ;f
(=zero? n3) ;t
(=zero? n4) ;f
