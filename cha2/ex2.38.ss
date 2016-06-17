; accumulate又叫fold-right，将序列的第一个元素组合到右边所有元素的组合结果上(先展开后由内到外递归收缩计算得到结果)

(define (fold-right op init seq)
	(if (null? seq)
		init
		(op (car seq)
			(fold-right op init (cdr seq)))))

; 对应的fold-left, 应用迭代计算

(define (fold-left op init seq)
	(define (iter result rest)
		(if (null? rest) 
			result
			(iter (op result (car rest)) (cdr rest))))
	(iter init seq))

; 下面表达式的值

(fold-right / 1 (list 1 2 3)) ; 3/2

(fold-left / 1 (list 1 2 3)) ; 1/6

(fold-right list '() (list 1 2 3)) ; (1 (2 (3 ())))

(fold-left list '() (list 1 2 3)) ; (((() 1) 2) 3)

; 要使fold-right和fold-left对相同的init 和 seq产生相同的结果，op需满足什么性质？

; fold-right 是递归计算的，而fold-left是迭代计算的，产生的计算轨迹与计算序列是不同的
; 要使产生相同结果，op必须符合结合律，比如 * 、+ 运算，如1*2*3=1*(2*3)=(1*2)*3, 而/、list不符合

(fold-right * 1 (list 1 2 3)) ; 6
(fold-left * 1 (list 1 2 3))  ; 6

(fold-right + 1 (list 1 2 3)) ; 7
(fold-left + 1 (list 1 2 3))  ; 7

