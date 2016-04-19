// 牛顿法求平方根
function square(x){
	return x*x
}

function abs(x){
	if(x<0) return -x
	else return x
}

function averge(x, y){
	return (x+y)/2
}

function sqrt(x){
	// guess值是否在误差范围内
	function good_enough(guess){
		return abs(square(guess) - x) < 0.0001
	}
	// 改进guess
	function improve(guess){
		return averge(guess, x/guess)
	}
	// 递归算出平方根，先判断guess值，精度不足则不断逼近要求精度的值
	function sqrt_iter(guess){
		if(good_enough(guess)) return guess
		else return sqrt_iter(improve(guess))
	}
	return sqrt_iter(1.0)
}

console.log(sqrt(2))
console.log(sqrt(99))
