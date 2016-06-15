; 假定已将x和y定义为如下的表

(define x (list 1 2 3))

(define y (list 4 5 6))

; 解释器会对下面的表达式打印什么结果

(append x y) ;(1 2 3 4 5 6)

(cons x y) ;((1 2 3) 4 5 6)

(list x y) ;((1 2 3) (4 5 6))

