; 枚举器
(define (enumerate-interval low high)
	(if (> low high)
		'()
		(cons low (enumerate-interval (+ low 1) high))))


; 累积器
(define (accumulate op init seq)
	(if (null? seq)
		init
		(op (car seq)
			(accumulate op init (cdr seq)))))

; 检查素数

(define (square x)
	(* x x))

(define (prime? n)

	(define (smallest-divisor n)

		(define (find-divisor n test-divisor)
			(cond ((> (square test-divisor) n) n)
				  ((= (remainder n test-divisor) 0) test-divisor)
				  (else (find-divisor n (+ test-divisor 1)))))

		(find-divisor n 2))

	(= (smallest-divisor n) n))

; 有序对

; (accumulate append
; 			'()
; 			(map (lambda (i) 
; 					(map (lambda (j) (list i j))
; 						 (enumerate-interval 1 (- i 1))))
; 				 (enumerate-interval 1 n)))

(define (flatmap proc seq)
	(accumulate append '() (map proc seq)))

; 给定整数n,产生出序对(i,j),其中1 <= j < i <= n
(define (unique-pairs n)
	(flatmap 
		(lambda (i)
			(map (lambda (j) (list i j))
				 (enumerate-interval 1 (- i 1))))
		(enumerate-interval 1 n)))

; 判断和是否为素数
(define (prime-sum? pair)
	(prime? (+ (car pair) (cadr pair))))

; 生成三元组(i, j, i+j)
(define (make-pair-sum-tuple pair)
	(list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

; 和为素数的序对
(define (prime-sum-pairs n)
	(map make-pair-sum-tuple
		 (filter prime-sum? 
		 	     (unique-pairs n))))


; test

(prime-sum-pairs 8) 
; ((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7) (6 1 7) (6 5 11) (7 4 11) (7 6 13) (8 3 11) (8 5 13))