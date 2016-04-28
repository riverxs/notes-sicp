// 练习1.6
// 问题描述：Alyssa P Hacker 看不出为什么需要将if提供为一种特殊形式
//（注：在scheme中条件表达式用cond表示，不限分支情况次数，最后一次条件用else表示。
// 但if为cond的受限形式，适用于分情况分析中只有两个情况的），
// 他想通过cond将它定义为一个常规过程，下面的newIf过程既是改写过的新过程（js写的，语义不变）

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
		newIf(good_enough(guess), guess, sqrt_iter(improve(guess)))
	}
	
	return sqrt_iter(1.0)
}
// 测试
console.log(sqrt(2)) // newif.html:39 Uncaught RangeError: Maximum call stack size exceeded

// 测试结果：栈溢出
// why? 改写后递归调用每次都需要调用newIf新函数，调用栈需要维护更多状态，栈的生长太快，导致栈很快就溢出
