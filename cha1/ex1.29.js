function cube(x){
	return x*x*x
}

// 递归计算模式表达求和概念

function sum(term, a, next, b){
	if(a>b) return 0
    return term(a) + sum(term, next(a), next, b)
}


// 辛普森数值积分方法

function simpsonIntegral(f, a, b, n){
	function add_h(x){
		return x + (b-a)/n
	}
	function add_2h(x){
		return x + 2*(b-a)/n
	}
	return (4 * sum(f, a, add_h, b) - 2 * sum(f, a, add_2h, b) - f(a) - f(b))*(b - a)/(3*n)
}
 
console.log(simpsonIntegral(cube,0,1,100)) // 0.2433333333333337
console.log(simpsonIntegral(cube,0,1,1000)) // 0.24933333333333416

// eg1.3.1.js中求积分结果
// console.log(integral(cube, 0, 1, 0.01)) ==> 0.24998750000000042

// 可以看出辛普森数值积分方法更加精确可靠