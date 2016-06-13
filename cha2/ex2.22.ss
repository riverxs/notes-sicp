; Louis改写ex2.21的第一个square-list过程，希望它能生成一个迭代计算过程

;改写如下
(define (square x)
	(* x x))

(define (square-list items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things) (cons (square (car things)) answer))))
	(iter items '()))

; test 

(square-list (list 1 2 3 4)) ;(16 9 4 1)

; 结果如上，元素的顺序与我们想要的结果正好相反
; 请解释为什么？

; 原因：参数应用采用正则序求值策略，先求出参数然后传入函数

; 计算过程如下

; (square-list (1 2 3 4))
; (iter (1 2 3 4) nil)
; (iter (2 3 4) (1))
; (iter (3 4) (4 1))
; (iter (4) (9 4 1))
; (iter nil (16 9 4 1))

; (16 9 4 1)

; Louis 又试着修正其程序，交换cons参数
(define (square-list items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things) (cons answer (square (car things))))))
	(iter items '()))

; test
(square-list (list 1 2 3 4)) ; ((((() . 1) . 4) . 9) . 16)

; 结果还是不行，解释为什么
 (cons 1 (cons 2 (cons 3 (cons 4 nil)))); (1 2 3 4) ; 此种嵌套的cons形成的序对的序列才叫表
 (cons (cons (cons 1 2) 3) 4); (((1 . 2) . 3) . 4) ; 而此种会产生表结构，元素的本身也是序对的序对

 ; 从上可看：修正后的程序迭代产生一个表结构，而非表

; 计算过程如下

; (square-list (1 2 3 4))
; (iter (1 2 3 4) nil)
; (iter (2 3 4)   (() . 1))
; (iter (3 4)     ((() . 1) . 4))
; (iter (4)       (((() . 1) . 4) . 9))
; (iter nil       ((((() . 1) . 4) . 9) . 16))

