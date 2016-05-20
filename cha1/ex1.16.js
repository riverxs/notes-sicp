// ex1.16.js

// 辅助基本过程
function square(x){
	return x*x
}

function ifEven(x){
	return x%2 == 0
}

// 递归定义，递归计算模型
function fast_expt(b,n){
	if(n===0) return 1
	if(ifEven(n)) return square(fast_expt(b, n/2))
	else return b*(fast_expt(b, n-1))
}

console.log(fast_expt(2,10)) // 1024

// 改写成迭代计算过程模型

function fast_expt_iter(b,n) {
	function expt_iter(b,n,a){
		if(n===0) return a
		if(ifEven(n)) return expt_iter(b*b, n/2, a)
		else return expt_iter(b, n-1, b*a)
	}
	return expt_iter(b, n, 1)
}
// 测试
console.log(fast_expt_iter(2,9)) // 512
console.log(fast_expt_iter(2,10)) // 1024
console.log(fast_expt_iter(2,11)) // 2048
