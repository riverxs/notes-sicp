; accumulate又叫fold-right，将序列的第一个元素组合到右边所有元素的组合结果上(先展开后由内到外递归收缩计算得到结果)

(define (fold-right op init seq)
	(if (null? seq)
		init
		(op (car seq)
			(fold-right op init (cdr seq)))))

; 对应的fold-left, 应用迭代计算

(define (fold-left op init seq)
	(define (iter result rest)
		(if (null? rest) 
			result
			(iter (op result (car rest)) (cdr rest))))
	(iter init seq))

; 基于fold-right和fold-left完成reverse

(define (reverse seq)
	(fold-right (lambda (x y) (append y (list x))) '() seq))

(reverse (list 1 2 3 4)) ; (4 3 2 1)

(define (reverse seq)
	(fold-left (lambda (x y) (cons y x)) '() seq))

(reverse (list 1 2 3 4)) ; (4 3 2 1)