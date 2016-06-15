; 直接定义

(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
        	        (square-tree (cdr tree))
        	        ))))
; test 
(define x (list 1 (list 2 (list 3 4) 5)))

(square-tree x) ; (1 (4 (9 16) 25))


; 使用map和递归组合定义

(define (square-tree tree)
	(map (lambda (sub-tree) 
		  (if (pair? sub-tree) 
		  	  (square-tree sub-tree)
		  	  (* sub-tree sub-tree))
		) tree))
      

; test 
(define x (list 1 (list 2 (list 3 4) 5)))

(square-tree x) ; (1 (4 (9 16) 25))
