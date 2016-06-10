; 序对的另一种过程性表示方式

(define (cons x y)
	(lambda (m) (m x y)))

(define (car z)
	(z (lambda (p q) p)))

(define (cdr z)
	(z (lambda (p q) q)))

; 验证，利用代换模型
; 以(car (cons 1 2))为例

; 首先计算参数(cons 1 2) => (car (lambda (m) (m 1 2)))   
; 然后带入car函数body用(lambda (p q) p)作为参数替换m执行 => (lambda (1 2) 1) => 1
; cdr 同理

; 翻译为js如下，arrow function 真是简洁啊

; let cons = (x, y) => m => m(x, y)
; let car = z => z((p, q) => p)
; let cdr = z => z((p, q) => q)

