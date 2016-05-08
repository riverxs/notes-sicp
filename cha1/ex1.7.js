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
	// function good_enough(guess){
	// 	return abs(square(guess) - x) < 0.0001
	// }
	//改进的good_enough
	function good_enough(oldGuess, newGuess){
		return abs(newGuess - oldGuess)/oldGuess < 0.0001
	}

	// 改进guess
	function improve(guess){
		return averge(guess, x/guess)
	}

	// 递归算出平方根，先判断guess值，精度不足则不断逼近要求精度的值
	// function sqrt_iter(guess){
	// 	if(good_enough(guess)) return guess
	// 	else return sqrt_iter(improve(guess))
	// }
	function sqrt_iter(guess){
		if(good_enough(guess, improve(guess))) return guess
		else return sqrt_iter(improve(guess))
	}
	
	return sqrt_iter(1.0)
}
// 测试,未改进前

console.log(sqrt(2)) //1.4142156862745097
console.log(sqrt(99)) //9.949874371188393
console.log(sqrt(0.00000009))//0.007816339388305803 结果错误
console.log(sqrt(0.00000009)*sqrt(0.00000009))//0.00006109516143318073
console.log(sqrt(9999999999999999999999999999999))//RangeError: Maximum call stack size exceeded, 大数精度问题

// 改进后
//1.4142156862745097
//9.949923682546618
//0.00030000000173609724
//9.000000104165835e-8
//3162348943003884
