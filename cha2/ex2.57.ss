; 扩充2.56求导程序，使之能处理任意项的和与乘积
; 如(deriv '(* x y (+ x 3)) 'x) 



; (define (make-sum a1 a2)
; 	(cond ((=number? a1 0) a2)
; 		  ((=number? a2 0) a1)
; 		  ((and (number? a1) (number? a2)) (+ a1 a2))
; 		  (else (list '+ a1 a2))))


; 只需改写augend和multiplicand

(define (augend a)
	(if (null? (cdddr a))
		 (caddr a)
		 (list '+ (caddr a) (cadddr a))))


; (define (make-product m1 m2)
; 	(cond ((or (=number? m1 0) (=number? m2 0)) 0)
; 		  ((=number? m1 1) m2)
; 		  ((=number? m2 1) m1)
; 		  ((and (number? m1) (number? m2)) (* m1 m2))
; 		  (else (list '* m1 m2))))


(define (multiplicand p)
	(if (null? (cdddr p))
		 (caddr p)
		 (list '* (caddr p) (cadddr p))))

; test
(deriv '(* x y (+ x 3)) 'x)  ; (+ (* x y) (* y (+ x 3)))
