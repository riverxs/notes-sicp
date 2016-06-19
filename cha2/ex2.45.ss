; 2.45 
; right-split 和 up-split 是更一般性划分操作split的实例

(define (split op1 op2)
	(define (split-instance painter n) 
		(if (= n 0)
			painter
			(let ((smaller (split-instance painter (- n 1))))
				 (op1 painter (op2 smaller smaller))))))

(define right-split (split beside below))

(define up-split (split below beside))
