; 将一棵树的所有叶子节点表示为一个表
(define (fringe tree)
	(cond ((null? tree) '())
		  ((not (pair? tree)) (list tree))   ; 基准(退化)情况
		  (else (append (fringe (car tree))  ; 归约步骤
		  	            (fringe (cadr tree))
		  	            ))))

(define x (list (list 1 2) (list 3 4)))

(define y (list x x))

(fringe x) ; (1 2 3 4)
(fringe y) ; (1 2 3 4 1 2 3 4)
