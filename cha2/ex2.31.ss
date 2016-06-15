; 将2.30的square-tree进一步抽象
(define (square x)
	(* x x))

(define (tree-map trans tree)
	(map (lambda (sub-tree) 
		  (if (pair? sub-tree) 
		  	  (square-tree sub-tree)
		  	  (trans sub-tree))
		) tree))

(define (square-tree tree)
	(tree-map square tree))

; test

(define x (list 1 (list 2 (list 3 4) 5)))

(square-tree x) ; (1 (4 (9 16) 25))

; 更一般化

(define (tree-map trans tree)
	(map (lambda (sub-tree) 
		  (if (pair? sub-tree) 
		  	  (trans-tree trans sub-tree)
		  	  (trans sub-tree))
		) tree))

(define (trans-tree trans tree)
	(tree-map trans tree))

(define (square x)
	(* x x))

(define (cubic x)
	(* x x x))

; test

(define x (list 1 (list 2 (list 3 4) 5)))
(trans-tree square x) ; (1 (4 (9 16) 25))
(trans-tree cubic x) ; (1 (8 (27 64) 125))
