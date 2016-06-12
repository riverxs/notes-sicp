; 矩形数据对象
(load "ex2.2.ss")
; constructor, 长宽表示
(define (make-rectangle l w)
	(cons l w))

; selector
(define (rectangle-length r)
	(car r))

(define (rectangle-width r)
	(cdr r))

; 基于上面的selector定义length-of-xxxx
(define (length-of-rectangle r)
	(let ((l (rectangle-length r))
		(let ((start-point (start-segment l))
			  (end-point (end-segment l)))
		    (- (x-point end-point) (x-point start-segment))))))

(define (width-of-rectangle r)
	(let ((w (rectangle-width r))
		(let ((start-point (start-segment w))
			  (end-point (end-segment w)))
		    (- (y-point end-point) (y-point start-segment))))))

; 周长

(define (perimeter r)
	(let ((l (length-of-rectangle r))
		  (w (width-of-rectangle r)))
	    (* 2 (+ l w))))

; 面积

(define (area r)
	(let ((l (length-of-rectangle r))
		  (w (width-of-rectangle r)))
	    (* l w)))


; test
(define l (make-segment (make-point 0 0) (make-point 4 0)))

(define w (make-segment (make-point 0 0) (make-point 0 3)))

(define r (make-rectangle l w))

(perimeter r) ; 14

(area r) ; 12

; 矩形的另外实现方式
