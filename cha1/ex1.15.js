
function cube(x) {
	return x*x*x
}

function p(x) {
	return 3*x -4*cube(x)
}
var n=0
function sine(angle) {
	if(!(Math.abs(angle) > 0.1)) return angle
	n++
	return p(sine(angle/3.0))
}

console.log(sine(12.15)) //-0.39980345741334

console.log(n)// 5, p被调用5次

// 求值sine(a)时，由过程sine所产生的计算过程使用的空间和步数（作为a的函数）增长的阶？
// 每次angle除以3.0，线性递归调用自身两次, 故空间和步数增长的阶：Θ(loga)

