// 练习1.6
// 问题描述：Alyssa P Hacker 看不出为什么需要将if提供为一种特殊形式（注：在scheme中条件表达式用cond表示，不限分支情况次数，最后一次条件用else表示。但if为cond的受限形式，适用于分情况分析中只有两个情况的），他想通过cond将它定义为一个常规过程，下面的newIf过程既是改写过的新过程（js写的，语义不变）

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
// 改写if的受限形式
function newIf(predicate, thenClause, elseClause){
	if(predicate) return thenClause
	else return elseClause
}

// 测试程序, 验证可行
newIf(2==3, 0, 5)  // 5
newIf(1==1, 0, 5)  // 0


function sqrt(x){
	// guess值是否在误差范围内
	function good_enough(guess){
		return abs(square(guess) - x) < 0.0001
	}
	// 改进guess
	function improve(guess){
		return averge(guess, x/guess)
	}
	// newIf改写的求平方根程序
	function sqrt_iter(guess){
		return newIf(good_enough(guess), guess, sqrt_iter(improve(guess)))
	}
	
	return sqrt_iter(1.0)
}
// 测试
console.log(sqrt(2)) // newif.html:39 Uncaught RangeError: Maximum call stack size exceeded

// 测试结果：栈溢出
// 
// 1. 无论good_enough(guess)为true或false，sqrt_iter都会递归下去
// why? newIf函数的过程计算的代换模型为应用序求值策略，先求实参再应用，而newIf中第三参数为
// sqrt_iter()函数，也就是说不论good_enough()结果如何，都会先递归sqrt_iter()
// ，而后调用newIf(), 再递归......
// 2.sqrt-iter 函数的返回值要被 new-if 作为参数使用，所以对 sqrt-iter 
// 的调用并不是尾递归，这样的话，尾递归优化自然也无法进行了，因此 new-if 和 sqrt-iter 
// 的递归会最终突破解释器的最大递归深度，从而造成错误：
