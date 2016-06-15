; church 数：用lambda函数表示数的概念

(define zero (lambda (f) (lambda (x) x))) ; zero次f 调用

(define (add-1 n)
	(lambda (f) (lambda (x) (f ((n f) x)))))

; 代换(add-1 zero)

(add-1 zero)

(lambda (f) (lambda (x) (f ((lambda (f) (lambda (x) x)) f) x)))

(lambda (f) (lambda (x) (f ((lambda (x) x) x))))

(lambda (f) (lambda (x) (f x)))

; 即 one

(define one (lambda (f) (lambda (x) (f x)))) ; 一次f调用

; two = (add-1 one), 代换得

(add-1 one)

(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))

(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))

(lambda (f) (lambda (x) (f (f x))))

; 即two

(define two (lambda (f) (lambda (x) (f (f x))))) ; 两次f嵌套调用
;f => x => f(f(x))

; 加法过程+的直接定义

; 由上观察可知(猜想)

(define three (lambda (f) (lambda (x) (f (f (f x)))))

(define two (lambda (f) (lambda (x) (f (f (f (f x)))))

; + 
(define (+ m n)
	)
