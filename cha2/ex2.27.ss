; 深度反转表中元素
(define (reverse items)
	(define (iter things result)
		(if (null? things)
			result
			(iter (cdr things) (cons (car things) result))))
	(iter items '()))

(define (deep-reverse items)
	(cond ((null? items) '())
		  ((not (pair? items)) items)
		  (else (cons (deep-reverse (car (reverse items))) 
		  			  (deep-reverse (cdr (reverse items)))
		  			  ))))

; test

(define x (list (list 1 2) (list 3 4))) ; x = ((1 2) (3 4))
(deep-reverse x) ; ((4 3) (2 1))

(define y (list (list 3 (list 4 5)) (list 6 7))) ; y = ((3 (4 5)) (6 7))
(deep-reverse y) ; ((7 6) ((5 4) 3))
