; 修改求导程序，使其适用中缀表达式

; 由于程序是工作在数据抽象上，屏蔽了细节表示的，所以只需修改具体的代数表示方式

; 定义求导算法，在抽象数据对象上定义
(define (deriv exp var)
	(cond ((number? exp) 0)
		  ((variable? exp)
		  	(if (same-variable? exp var) 1 0))
		  ((sum? exp)
		  	(make-sum (deriv (addend exp) var)
		  			  (deriv (augend exp) var)))
		  ((product? exp)
		  	(make-sum
		  	(make-product (multiplier exp)
		  				  (deriv (multiplicand exp) var))
		  	(make-product (deriv (multiplier exp) var)
		  				  (multiplicand exp))))
		  (else
		  	(error "unknown expression type == DERIV" exp))))

; 代数表达式的表示

; 变量判断
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
	(and (variable? v1) (variable? v2) (eq? v1 v2)))

; 和式的表示

(define (make-sum a1 a2)
	(cond ((=number? a1 0) a2)
		  ((=number? a2 0) a1)
		  ((and (number? a1) (number? a2)) (+ a1 a2))
		  (else (list a1 '+ a2))))

(define (=number? a num)
	(and (number? a) (= a num)))

; 和式判断
(define (sum? x)
	(and (pair? x) (eq? (cadr x) '+)))

; 被加数
(define (addend a)
	(car a))

; 加数
(define (augend a)
	(caddr a))


; 乘式表示
(define (make-product m1 m2)
	(cond ((or (=number? m1 0) (=number? m2 0)) 0)
		  ((=number? m1 1) m2)
		  ((=number? m2 1) m1)
		  ((and (number? m1) (number? m2)) (* m1 m2))
		  (else (list m1 '* m2))))

;判断

(define (product? x)
	(and (pair? x) (eq? (cadr x) '*)))

; 被乘数

(define (multiplier p)
	(car p))

; 乘数

(define (multiplicand p)
	(caddr p))

; test

(deriv '(x + (3 * (x + (y + 2)))) 'x) ; 4
(deriv '(x + (3 * (x + (y + 2)))) 'y) ; 3
(deriv '(x * (y * (x + 3))) 'x)  ;((x * y) + (y * (x + 3)))


; (b) 求导程序满足标准代数写法：(x + 3 * (x + y + 2))

(define (augend a)
	(if (pair? (caddr a))
		(caddr a)
		(cddr a)))

(define (multiplicand p)
	(if (pair? (caddr p))
		(caddr p)
		(cddr p)))

