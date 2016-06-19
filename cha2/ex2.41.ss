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

(define (flatmap proc seq)
	(accumulate append '() (map proc seq)))

; 三元组
(define (unique-pairs n)
	(accumulate append '() 	(flatmap 
		(lambda (i)
		(map (lambda (j) 
			(map (lambda (k) 
				(list i j k))
					(filter (lambda (x) (and (not (= i x)) (not (= j x)))) (enumerate-interval 1 n)))
		) (filter (lambda (x) (not (= i x))) (enumerate-interval 1 n)))
	) (enumerate-interval 1 n))))

; test
(unique-pairs 5)

; ((1 2 3) (1 2 4) (1 2 5) (1 3 2) (1 3 4) (1 3 5) (1 4 2)
;  (1 4 3) (1 4 5) (1 5 2) (1 5 3) (1 5 4) (2 1 3) (2 1 4)
;  (2 1 5) (2 3 1) (2 3 4) (2 3 5) (2 4 1) (2 4 3) (2 4 5)
;  (2 5 1) (2 5 3) (2 5 4) (3 1 2) (3 1 4) (3 1 5) (3 2 1)
;  (3 2 4) (3 2 5) (3 4 1) (3 4 2) (3 4 5) (3 5 1) (3 5 2)
;  (3 5 4) (4 1 2) (4 1 3) (4 1 5) (4 2 1) (4 2 3) (4 2 5)
;  (4 3 1) (4 3 2) (4 3 5) (4 5 1) (4 5 2) (4 5 3) (5 1 2)
;  (5 1 3) (5 1 4) (5 2 1) (5 2 3) (5 2 4) (5 3 1) (5 3 2)
;  (5 3 4) (5 4 1) (5 4 2) (5 4 3))

(define (tuple-sum-s s n)
	(filter (lambda (x) (= s (+ (car x) (cadr x) (caddr x)))) (unique-pairs n)))

; test

(tuple-sum-s 8 5)

; ((1 2 5) (1 3 4) (1 4 3) (1 5 2) (2 1 5) (2 5 1) (3 1 4)
;   (3 4 1) (4 1 3) (4 3 1) (5 1 2) (5 2 1))

(tuple-sum-s 7 5)

; ((1 2 4) (1 4 2) (2 1 4) (2 4 1) (4 1 2) (4 2 1))