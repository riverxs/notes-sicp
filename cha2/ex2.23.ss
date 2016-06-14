; 过程for-each 和map 类似，但它并不返回结果的表，只是对表中的元素迭代且每轮迭代执行一些动作，如打印
; 和JS中的数组的forEach函数一样

; 调用例子
(for-each (lambda (x) (newline) (display x))
	(list 57 321 88))

; 结果如下

; 57
; 321
; 88

; 定义for-each, 注意：特殊条件表达式if的else只支持单条表达式，此处采用cond

; for-each调用结束返回逻辑真值
(define (for-each proc items)
	(cond ((null? items) #t)
		(else (proc (car items))
		      (for-each proc (cdr items)))))

; 不返回值
(define (for-each proc items)
	(cond ((not (null? items))
		(proc (car items))
		(for-each proc (cdr items)))))

; test

(for-each (lambda (x) (newline) (display x))
	(list 57 321 88))

; 57
; 321
; 88
