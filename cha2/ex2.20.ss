; 表的过滤
(define (same-parity . w)
	(define (parity filter w)
		(if (null? w)
			'()
			(if (filter (car w))
				(cons (car w) (parity filter (cdr w)))
				(parity filter (cdr w)))))
	(if (odd? (car w))
		(parity (lambda (x) (odd? x)) w)
		(parity (lambda (x) (even? x)) w))
	)

; test
 (same-parity 1 2 3 4 5) ; (1 3 5)

 (same-parity 2 3 4 6 7) ; (2 4 6)

 (same-parity 1 2 3 3 5 5 6) ; (1 3 3 5 5)
