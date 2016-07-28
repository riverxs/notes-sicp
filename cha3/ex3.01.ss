; 累加器，维持累加值的局部状态

(define (make-accumulator init)
	(lambda (av)
		; 引进赋值set!
		(begin (set! init (+ init av)) init)))

(define A (make-accumulator 5))

(A 10) ; 15

(A 10) ; 25

(define B (make-accumulator 5))

(B 10) ; 15

(B 10) ; 25

; A与B互不影响，是两个相互独立的对象