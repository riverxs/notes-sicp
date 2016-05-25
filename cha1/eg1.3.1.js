
/* 高阶函数——函数作为参数*/


// 求a到b的各整数之和

function intergerSum(a, b){
	if(a>b) return 0
	return a + intergerSum(a+1, b)
}

// 测试用例,下同

console.log(intergerSum(1,100)) // 5050

// 求a到b的立方和

function cube(x){
	return x*x*x
}

function cubeSum(a, b){
	if(a>b) return 0
    return cube(a) + cubeSum(a+1, b)
}
console.log(cubeSum(1,10)) // 3025

// 求 1/(1*3) + 1/(5*7) + 1/(9*11) + ......的和

function piSum(a,b) {
	if(a>b) return 0
    return 1/(a*(a+2)) + piSum(a+4, b)
}
console.log(8*piSum(1,1000)) // 3.139592655589783


// 由上可看出存在公共模式，表达求和的概念(抽象共有模式)，而不是具体的求和

// 递归模式

function sum(term, a, next, b){
	if(a>b) return 0
    return term(a) + sum(term, next(a), next, b)
}

// 基于sumPattern定义sumIntegers

function identify(x){
	return x
}

function inc(n) {
	return n + 1
}

function intergerSum2(a,b){
	return sum(identify, a, inc, b)
}
console.log(intergerSum2(1,100))  // 5050


// 基于sumPattern定义sumCubes 

function cubeSum2(a,b) {
	return sum(cube, a, inc, b)
}
console.log(cubeSum2(1,10)) // 3025

// 基于sumPattern定义piSum

function piSum2(a, b){
	function piTerm(x){
		return 1.0 / (x * (x + 2))
	}
	function piNext(x){
		return x + 4
	}
	return sum(piTerm, a, piNext, b)
}
console.log(8*piSum2(1,1000)) // 3.139592655589783

// 求函数f在范围a和b之间的定积分的近似值
// 即求[f(a + dx/2) + f(a + dx + dx/2) + f(a + 2dx + dx/2) + ....]*dx
// 以sumPattern作为基本构件去形式化该概念

function integral(f, a, b, dx){
	function add_dx(x){
		return x + dx
	}
	return sum(f, a+dx/2, add_dx, b) * dx
}
console.log(integral(cube, 0, 1, 0.01)) // 0.24998750000000042
