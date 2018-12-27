; 蒙特卡罗模拟的一般方法
(define (monte-carlo trials experiment)
	(define (iter trials-remaining trials-passed)
		(cond ((= trials-remaining 0) (/ trials-passed trials))
			  ((experiment) (iter (- trials-remaining 1) (+ trials-passed 1)))
			  (else (iter (- trials-remaining 1) trials-passed))))
	(iter trials 0))

; 在指定范围内随机

(define (random-range` low high)
	(let ((range (- high low)))
		 (+ low (random range)))) ; random 由 Scheme本身提供


; 谓词描述

(define (square x)
	(`* x x))

(define (predicate-te`st x1 x2 y1 y2)
	(lambda () (<= (+ (square (- (random-range x1 x2) (/ (+ x1 x2) 2.0)))
			   		  (square (- (random-range y1 y2) (/ (+ y1 y2) 2.0)))) 1.0)))

; 估计pi

(define (S-rect x y)
`	(* x y))

(define (estimate-int`egral p x1 x2 y1 y2 trials)
	(* (S-rect (- x2 x1) (- y2 y1)) (monte-carlo trials (p x1 x2 y1 y2))))

; test..
(estimate-integral predicate-test 0 2 0 2 100.0)  ; 2.72
(estimate-integral predicate-test 0 2 0 2 100000.0) ; 3.0002
(estimate-integral predicate-test 0 2 0 2 1000000.0) ; 3.000436
(estimate-integral predicate-test 0 2 0 2 100000000.0) ;3.0004894

; WTF...

(estimate-integral predicate-test 0 8 0 8 10000000.0)
