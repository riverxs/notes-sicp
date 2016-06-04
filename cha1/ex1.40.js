var tolerance = 0.00001
// 求f的不动点
function fixedPoint(f, firstGuess){
	function closeEnough(v1, v2) {
		return Math.abs(v1 - v2) < tolerance
	}
	function tryFixed(guess) {
		var next = f(guess)
		if(closeEnough(guess, next)) {
			return next
		}
		return tryFixed(next)
	}
	return tryFixed(firstGuess)
}

// 描述导数概念

var dx = 0.00001
// deriv :: Function -> Function
function deriv(g) {
	return x => ( g(x + dx) - g(x) )/dx
}

// 将g(x)转变成f(x)
// newtonTransform :: Function -> Function
function newtonTransform(g) {
	return x => x - g(x)/deriv(g)(x)
}

// 求不动点
function newtonsMethod(g, guess) {
	return fixedPoint(newtonTransform(g), guess)
}

// 定义过程cubic

function cubic(a, b, c) {
	return x => x*x*x + a*x*x + b*x + c
}

console.log(newtonsMethod(cubic(1,2,3), 1)) //-1.2756822036498454
