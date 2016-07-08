; 给出构造函数make-vect, 以及选择函数xcor-vect和ycor-vect，借此实现过程add-vect,sub-vect,scale-vect,完成向量加法，减法，以及伸缩

(define (make-vect x y)
	(cons x y))

(define (xcor-vect v)
	(car v))

(define (ycor-vect v)
	(cdr v))

; 向量加法
(define (add-vect v1 v2)
	(make-vect (+ (xcor-vect v1) (xcor-vect v2))
			   (+ (ycor-vect v1) (ycor-vect v2))))

; 向量减法
(define (sub-vect v1 v2)
	(make-vect (- (xcor-vect v1) (xcor-vect v2))
			   (- (ycor-vect v1) (ycor-vect v2))))

; 向量的伸缩
(define (scale-vect s v)
	(make-vect (* s (xcor-vect v))
			   (* s (ycor-vect v))))



; 框架的坐标映射
; map equation: Origin(frame) + x*edge1(frame) + y*edge2(frame)

(define (frame-coord-map frame)
	(lambda (v)
		(add-vect
			(origin-frame frame)
			(add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
					  (scale-vect (ycor-vect v) (edge2-frame frame))))))

