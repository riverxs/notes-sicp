// 1.2.2 节fib_iter()计算过程中状态变量a和b的变换规则有：a<-a+b, b<-a
// 迭代计算表示上述过程，状态变量的迭代
function fib(n){
	function fib_iter(a,b,count){
		if(count === 0) return b
		return fib_iter(a+b, a, count - 1)
	}
	return fib_iter(1, 0, n)
}
console.log(fib(5)) // 5


/// 练习1.19

// 将