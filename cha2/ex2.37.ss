; 累积器
(define (accumulate op init seq)
	(if (null? seq)
		init
		(op (car seq)
			(accumulate op init (cdr seq)))))


(define (accumulate-n op init seqs)
	(if (null? (car seqs))
		'()
		(cons (accumulate op init (map (lambda (x) (car x)) seqs))
			  (accumulate-n op init (map (lambda (x) (cdr x)) seqs))
			  )))

; 用序列将矩阵m=(mij)表示为
; ((1 2 3 4) (4 5 6 6) (6 7 8 9)),从而用序列来简洁的操作基本的矩阵和向量运算

(define m (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define v (list 2 3 4 5))
(define w (list 5 4 3 2))

; 点积定义

(define (dot-product v w)
	(accumulate + 0 (map * v w))) ; map为Scheme原生扩展了的

(dot-product v w) ; 44

; 返回向量T, 其中Ti = ∑jMijVj(i,j为下标)

(define (matrix-*-vector m v)
	(map (lambda (x) 
		(if (not (null? (car v))) 
			(* (car v) (accumulate + 0 x))
			(matrix-*-vector m (cdr v)))) m))

(matrix-*-vector m v) ; (20 42 60)

; 返回矩阵N，其中Nij=Mji(i,j 为下标)

(define (transpose mat)
	(accumulate-n cons '() mat))

(transpose m) ; ((1 4 6) (2 5 7) (3 6 8) (4 6 9))

(define n (list (list 1 4 6) (list 2 5 7) (list 3 6 8) (list 4 6 9)))

; 返回矩阵P, 其中Pij = ∑kMikNkj(i,j,k为下标)
(define (matrix-*-matrix m n)
	(let ((cols (transpose n)))
		 (map (lambda (x) (matrix-*-vector cols x)) m)))

(matrix-*-matrix m n) ; ((10 21 30) (40 84 120) (60 126 180))
