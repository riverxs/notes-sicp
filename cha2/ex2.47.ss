; 框架的具体实现

; 实现1

; 构造函数
(define (make-frame origin edge1 edge2)
	(list origin edge1 edge2))

; 选择函数
(define (origin-frame frame)
	(car frame))

(define (edge1-frame frame)
	(cadr frame))

(define (edge2-frame frame)
	(caddr frame))

; 实现2

(define (make-frame origin edge1 edge2)
	(cons origin (cons edge1 edge2)))

; 选择函数
(define (origin-frame frame)
	(car frame))

(define (edge1-frame frame)
	(cadr frame))

(define (edge2-frame frame)
	(cddr frame))
