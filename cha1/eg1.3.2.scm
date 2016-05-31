;用lambda 构造过程

(lambda (x) (+ x 1))

; 在JS中可以表达为
; function(x) {return x+1} 或ES6语法：x=>x+1

(define (plus4 x) (+ x 4))

; 等价于

(define plus4 (lambda (x) (+ x 4)))

;; ES6中
let plus4 = x => x+4

; 调用lambda函数

((lambda (x y z) (+ x y (* z z))) 1 2 3)
; 12

; ES6中
((x,y,z) => x+y+z*z)(1,2,3) // 12

; 用let 创建局部变量

; 描述f(x, y) = x(1+xy)^2 + y(1-y) + (1+xy)(1-y)

; 用lambda 表示

(define (f x y)
	((lambda (a b) 
		(+ (* x (square a))
		   (* y b)
		   (* a b)))
	 (+ 1 (* x y))
	 (- 1 y)))

; 用ES6的lambda表示为

function f(x, y){
	return ((a, b) => x * square(a) + y * b + a * b)(1 + (x * y), 1 - y)
}

; 利用let建立局部变量表示, 将表达式在局部关联名字

(define (f x y)
	(let ((a (+ 1 (* x y)))
		  (b (- 1 y)))
	  (+ (* x (square a))
	  	 (* y b)
	  	 (* a b))))

; ES6写法

function f(x, y) {
	let a = 1 + x*y
	let b = 1 - y
	return x*square(a) + y*b + a*b
}

; 可以看出let语法可以作为lambda立即求值函数的语法外衣

; let 使人能在尽可能接近其使用的地方建立局部变量约束

(+ (let ((x 3))
	   (+ x (* x 10)))
	x)

; 上面表达式如果传入x=5 那么表达式的值为38

; 用ES6写相当于let声明了块级作用域, 其声明的变量作用域就为该let的体{}

{
	let x = 3
	x + x*10
} + x 

; 上面 let 声明的x 属于{}内部，不会影响到外部x

; 其外Scheme中规定变量的值在let 之外计算

(let ((x 3)
	  (y (+ x 2)))
	(* x y))

; 如果x=2,那么表达式的值为12

; 另：Scheme中的define关联名字和let具有相同的效果，但一般用let关联局部变量，define定义(内部)函数

