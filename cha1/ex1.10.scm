; ex1.10.scm

; 下面过程计算一个称为Ackermann函数的数学函数

(define (A x y)
	(cond ((= y 0) 0)
		  ((= x 0) (* 2 y))
		  ((= y 1) 2)
		  (else (A (- x 1)
		  		   (A x (- y 1))))))


; 下面各表达式的值是什么？

(A 1 10) ; 1024
(A 2 4)  ; 65536
(A 3 3)  ; 65536

;;; 请给出f, g, h 对给定整数值n所计算的函数的数学定义

 (define (f n) (A 0 n)) ;;; f(n) = 2*n
 (define (g n) (A 1 n)) ;;; g(n) = 2^n
 (define (h n) (A 2 n)) ;;; h(n) = 2^(2^2(2^(...(2)))) , h(n)的值为2的上次结果次幂