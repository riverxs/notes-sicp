; 线性同余法得到伪随机数
(define (rand-update x)
	(define (update a b m)
		(remainder (+ (* a x) b) m))
	(update 7 4 9))

; 原先rand函数

; (define rand 
; 	(let ((x 1))
; 		(lambda ()
; 			(set! x (rand-update x))
; 			x)))

; 改进

(define rand
	(let ((x 1))
		(lambda (op)
			(cond ((eq? op 'generate) 
						(begin (set! x (rand-update x))
						x))
				  ((eq? op 'reset) 
				  	(lambda (nv)
				  		(set! x nv)))))))

(rand 'generate) ; 2
(rand 'generate) ; 0
(rand 'generate) ; 4
(rand 'generate) ; 5

((rand 'reset) 3) 
(rand 'generate) ; 7
(rand 'generate) ; 8
(rand 'generate) ; 6
(rand 'generate) ; 1

((rand 'reset) 3)
(rand 'generate) ; 7
(rand 'generate) ; 8
(rand 'generate) ; 6
(rand 'generate) ; 1



