// Scheme如下

(define (f g)
	(g 2))

//故有 
(define (square x) (* x x))

(f square) // 4

(f (lambda (z) (* z (+ z 1)))) // 6

// 问题：如果要求解释器求(f f) 会发生什么？
(f f) // Exception: attempt to apply non-procedure 2

// 改写js

function f(g) {
	retrun g(2)
}

function square(x) {
	retrun x*x
}

f(square) // 4

f(z => z * (z + 1)) // 6

f(f)  // SyntaxError: Unexpected identifier, 即2不是一个过程名，不能用来调用

