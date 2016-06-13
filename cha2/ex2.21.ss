; 对表的映射map
; 第一种定义
(define (square-list items)
  (if (null? items)
      '()
      (cons (* (car items) (car items)) (square-list (cdr items)))))

; test
(square-list (list 1 2 3 4)) ; (1 4 9 16)

; 第二种定义, 其实sheme内置了map函数
(define (map prog items)
	(if (null? items)
		'()
		(cons (prog (car items)) (map prog (cdr items)))))

(define (square-list items)
	(map (lambda (x) (* x x)) items))

(square-list (list 1 2 3 4)) ; (1 4 9 16)