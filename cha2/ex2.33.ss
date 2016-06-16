; 累积器
(define (accumulate op init seq)
	(if (null? seq)
		init
		(op (car seq)
			(accumulate op init (cdr seq)))))

; accumulate定义map
(define (map p seq)
	(accumulate (lambda (x y) (cons (p x) y)) '() seq))

(define x (list 1 2 3 4))

(map (lambda (x) (* x x)) x) ;(1 4 9 16)


; accumulate定义append
(define (append seq1 seq2)
	(accumulate cons seq2 seq1))

(define y (list 5 6 7 8))

(append x y) ; (1 2 3 4 5 6 7 8)

; accumulate定义length
(define (length seq)
	(accumulate  (lambda (x y) (+ 1 y)) 0 seq))
(length x) ; 4