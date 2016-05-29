;; 定义一个过程，以三个数为参数，返回其中较大的两个数之和

(define (bigger x y)
	(if (> x y) 
		x
		y))

(define (smaller x y)
	(if (> x y)
		y
		x))

(define (bigger_sum x y z)
	(+ (bigger x y) (bigger (smaller x y) z))
)


;; (bigger_sum 1 2 3) 5
;; (bigger_sum 2 1 3) 5
;; (bigger_sum 3 2 1) 5