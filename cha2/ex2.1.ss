; ex2.1.ss

; 数据抽象

; 有理数的计算实例

; 有理数的表示,构造一个序对表示有理数

; (define (make-rat n d) (cons n d))

(define (gcd a b)
	(if (= b 0)
		a
		(gcd b (remainder a b))))

; 根据题意：(n>0&&d>0) n/d=n/d; (n<0&&d<0) -n/-d=n/d; (n<0||d<0) -n/d
(define (make-rat n d)
	(let ((g (gcd n d)))
		 (if (< d 0)
		 	(cons (/ (-n) g) (/ (-d) g))
		 	(cons (/ n g) (/ d g)))))


; 取有理数的分子 
(define (number x) (car x))

; 取有理数的分母
(define (denom x) (cdr x))

; 用上述规则表示有理数计算

; 表示 n1/d1 + n2/d2 = (n1d2 + n2d1)/d1d2

(define (add x y)
	(make-rat (+ (* (number x) (denom y))
				 (* (number y) (denom x)))
			  (* (denom x) (denom y))))

; 表示n1/d1 = n2/d2 当且仅当n1d2 = n2d1

(define (equal-rat? x y) 
	(= (* (number x) (denom y))
	   (* (number y) (denom x))))

; 显示有理数

(define (print-rat x) 
	(newline)
	(display (number x))
	(display "/")
	(display (denom x)))

; 试验有理数过程

; 1/2 
(define one-half (make-rat 1 2))

; 1/3
(define one-third (make-rat 1 3))

; add-rat
(print-rat (add-rat one-third one-third)) ; 6/9 , should be 2/3

; 改进make-rat,使其能化简到最简形式

; (define (gcd a b)
; 	(if (= b 0)
; 		a
; 		(gcd b (remainder a b))))

; (define (make-rat n d)
; 	(let ((g (gcd n d)))
; 		 (cons (/ n g) (/ d g))))

; print-rat with add-rat again
(print-rat (add-rat one-third one-third)) ; 2/3

; 练习2.1 ，改进make-rat使其可以正确处理正数和负数
		
 ; 测试 
(print-rat (add-rat one-third one-third)) ; 2/3

(define neg-one-third (make-rat -1 3))
(print-rat (make-rat 2 6))   ; 1/3
(print-rat (make-rat -2 -6)) ; 1/3
(print-rat (make-rat -2 6))  ; -1/3
(print-rat (make-rat 2 -6))  ; -1/3
(print-rat (add-rat neg-one-third neg-one-third)) ; 2/3

(print-rat (add-rat one-half neg-one-third)) ; 1/6
