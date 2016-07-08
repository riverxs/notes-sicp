; 向量构造函数
(define (make-vect x y)
	(cons x y))


; 线段构造函数
(define (make-segment start end)
	(list start end))

(define (start-segment s)
	(car s))

(define (end-segment s)
	(cadr s))

; test 

(define start (make-vect 1 2))

(define end (make-vect 3 4))

(define s (make-segment start end))

(start-segment s) ; (1 . 2)

(end-segment s) ; (3 . 4)

