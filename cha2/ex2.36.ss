
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

; test
(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(accumulate-n + 0 s) ; (22 26 30)
(accumulate-n * 1 s) ; (280 880 1944)
