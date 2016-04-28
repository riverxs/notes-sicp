// 练习1.8 : 牛顿法求立方根，在求平方根的基础上更改公式

function abs(x){
	if(x<0) return -x
	else return x
}

function averge(x, y){
	// return (x+y)/2
	return (2*x + y)/3
}

function cube(x){
	return x*x*x
}

function sqrt(x){
	// guess值是否在误差范围内
	function good_enough(guess){
		return abs(cube(guess) - x) < 0.0001
	}
	// 改进guess
	function improve(guess){
		// return averge(guess, x/guess)
		return averge(guess, x/(guess*guess))
	}
	// 递归求解，先判断guess值，精度不足则不断逼近要求精度的值
	function sqrt_iter(guess){
		if(good_enough(guess)) return guess
		else return sqrt_iter(improve(guess))
	}
	return sqrt_iter(1.0)
}
// 测试
console.log(sqrt(8)) // 2.000004911675504
console.log(sqrt(27)) // 3.0000005410641766
console.log(sqrt(99)) // 4.626066084248356
console.log(sqrt(99999)) // 46.41573361720024
