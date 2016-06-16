; 累积器
(define (accumulate op init seq)
	(if (null? seq)
		init
		(op (car seq)
			(accumulate op init (cdr seq)))))


;方法一：根据书中说明使用map(列表各元素是sub-tree的leaf数)
(define (count-leaves tree)
	(accumulate 
		+ 
		0 
		(map (lambda (sub-tree) 
					 (if (pair? sub-tree) 
					 	 (count-leaves sub-tree)
					 	 1)) tree)))


; test
(define s (list (list 1 (list 2 3)) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
(count-leaves s) ; 12


; 方法二：利用枚举函数

; 枚举leaf
(define (enumerate-tree tree)
	(cond ((null? tree) '())
		  ((not (pair? tree)) (list tree))
		  (else (append (enumerate-tree (car tree))
		  	            (enumerate-tree (cdr tree))
		  	            ))))


(define (count-leaves tree)
	(accumulate (lambda (x y) (+ 1 y)) 0 (enumerate-tree tree)))

; 相当于：(define (count-leaves tree) (length (enumerate-tree tree)))
; test
(count-leaves s) ; 12


