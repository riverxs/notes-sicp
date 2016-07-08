
; 变量判断
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
	(and (variable? v1) (variable? v2) (eq? v1 v2)))

; 求导
(define (deriv exp var)
	(cond ((number? exp) 0)
		  ((variable? exp)
		  	(if (same-variable? exp var) 1 0))
		  (else ((get 'deriv (operator exp)) (operands exp) var))))

(define (operator exp) (car exp))

(define (operands exp) (cdr exp))

; sum-deriv-package

(define (install-sum-deriv-package)
	;; internal procedures
	(define (make-sum a1 a2)
		(cond ((=number? a1 0) a2)
			  ((=number? a2 0) a1)
			  ((and (number? a1) (number? a2)) (+ a1 a2))
			  (else (list '+ a1 a2))))

	(define (=number? a num)
		(and (number? a) (= a num)))

	(define (deriv-sum operands var)
		(make-sum (deriv (car operands) var)
				  (deriv (cadr operands) var)))

	;; interface to the rest of system
	(put 'deriv '+ 
		(lambda (operands var) (deriv-sum operands var))
		)
	'done)

; product-deriv-package
(define (install-product-deriv-package)
	 ;; internal procedures
	(define (make-product m1 m2)
		(cond ((or (=number? m1 0) (=number? m2 0)) 0)
			  ((=number? m1 1) m2)
			  ((=number? m2 1) m1)
			  ((and (number? m1) (number? m2)) (* m1 m2))
			  (else (list '* m1 m2))))

	(define (=number? a num)
		(and (number? a) (= a num)))

	(define (product-deriv operands var)
		(make-sum 
			(make-product (car operands)
						  (deriv (cadr operands) var)
			(make-product (deriv (car operands) var)
						  (cadr operands)))))

	(put 'deriv '* 
		(lambda (operands var) (product-deriv operands var))
		)

	'done)

(install-sum-deriv-package)
(install-product-deriv-package)
 
; test
(deriv '(+ x 3) 'x) ; 1

(deriv '(* x y) 'x) ; y

(deriv '(* (* x y) (+ x 3)) 'x) 