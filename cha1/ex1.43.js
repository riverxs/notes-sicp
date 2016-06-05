// 函数组合 compose :: (Function, Function) => Function
var compose = (f, g) => x => f(g(x))

// 求平方

var squre = x => x*x 

// repeated 函数，递归计算

var repeated = (f, n) => {
	if (n==1) return f
	return x => {
		// let fn = repeated(f, n-1)
		// return f(fn(x))
		return f(repeated(f, n-1)(x))
	}
}

console.log(repeated(squre, 2)(5)) //625

// 使用compose

function repeated2(f, n) {
	if(n==1) return f
	return compose(f, repeated2(f, n-1))
}

console.log(repeated2(squre, 2)(5)) //625
