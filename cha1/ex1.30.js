// 改写eg1.3.1中的sum函数递归计算模型为迭代计算模型
function sum(term, a, next, b){
	function iter(a, result){
		if(a > b) return result
		return iter(next(a), result + term(a))
	}
	return iter(a, 0)
}

//  测试

// 基于迭代sum定义intergerSum2

function identify(x){
	return x
}

function inc(n) {
	return n + 1
}

function intergerSum2(a,b){
	return sum(identify, a, inc, b)
}
console.log(intergerSum2(1,100))  // 5050 正确
