// 递归计算过程
// 从代换模型看出这是一种先逐步展开而后收缩的形状
// 展开阶段构造了一个推迟计算所形成的链条，为了收缩阶段计算，解释器需要维护好这些以后要执行的操作的轨迹（计算所需的信息），要保存正比与n的信息，空间复杂度O(N)
// 收缩阶段开始真正的计算
// 这种类型的计算过程由一个推迟进行的运算链条来描述，称之为线性递归计算过程

function factorial_1(n){
	if(n === 1) return 1
	return n * factorial_1(n - 1)
}
console.log(factorial_1(6)) //720

// 计算轨迹如下

// 6*factorial_1(5)
// 6*5*factorial_1(4)
// 6*5*4*factorial_1(3)
// 6*5*4*3*factorial_1(2)
// 6*5*4*3*2*factorial_1(1)
// 6*5*4*3*2*1
// 6*5*4*3*2
// 6*5*4*6
// 6*5*24
// 6*120
// 720


// 尾递归（递归描述的迭代计算过程，常规的过程调用表达迭代）

// 区分递归计算过程和递归过程
// 递归过程：过程的定义中直接或间接的调用了该过程本身，说的是语法形式上的事实
// 递归计算过程：说的是该计算过程的进展方式，而不是相应的语法形式
// 递归过程产生迭代计算过程：尽管该过程还是由递归表达，但是计算过程却是迭代的，计算过程完全由状态变量刻画，解释器在执行时，只需维护最新的状态变量就够了


// 用固定数目的状态变量描述的计算过程，在此为counter，total。
// 同时又有一套规则描述计算过程在从上一个状态到下一个状态转变时这些状态变量的更新方式，此处状态变量更新方式分别为counter - 1和 counter * total
// 同时还有一个(可能有的，没有的话就是死循环)结束检测，它描述了这一计算过程应该终止的条件
// 该计算过程中解释器只需维护状态变量的轨迹就行了，因而总能在常量空间完成计算,空间复杂度O(1)
// 尾递归的实现完全可以取代循环，也让那些复杂的专用迭代结构变成不过是语法糖衣


function factorial_2(n) {
	function factorial(counter, total){
		if(counter === 1) return total
		return factorial(counter - 1, counter * total)
	}
	return factorial(n, 1)
}
console.log(factorial_2(6)) //720

// 计算轨迹

// factorial_2(6)
// factorial(6,1)
// factorial(5,6)
// factorial(4,30)
// factorial(3,120)
// factorial(2,360)
// factorial(1,720)

// 同上，迭代型计算过程
function factorial_3(n) {
	function fact_iter(total, counter){
		if(counter > n) return total
		return fact_iter(total * counter, counter + 1)
	}
	return fact_iter(1,1)	
}

console.log(factorial_3(6)) //720

// 计算轨迹

// factorial_3(6)
// fact_iter(1,1)
// fact_iter(1,2)
// fact_iter(2,3)
// fact_iter(6,4)
// fact_iter(24,5)
// fact_iter(120,6)
// fact_iter(720,7)



// 循环表达迭代过程

function factorial_4(n){
	var fact = 1
	// 循环表达迭代, 需要用到语言提供的专用迭代结构
	// 交代各种细节：状态变量的声明，退出条件，状态变量的变化方式
	for(var i = 1; i <= n; i++){
		fact = fact * i
	}
	return fact
}
console.log(factorial_4(6)) // 720


// 树形递归计算模式

// 典型代表斐波那契数列Fibonacci
// 递归表示该计算有太多冗余计算，计算步骤数随着输入指数增长，空间需求随着输入增长线性增长

function Fib(n) {
	if(n===0) return 0
	if(n===1) return 1
	else {
		return Fib(n-1) + Fib(n-2)
	}
}
console.log(Fib(5)) // 5

// 计算轨迹
// Fib(4) + Fib(3)
// (Fib(3) + Fib(2)) + (Fib(2) + Fib(1))
// ((Fib(2) + Fib(1)) + (Fib(1) + Fib(0))) + (F(1) + Fib(0) + Fib(1))
// ((Fib(1) + Fib(0) + Fib(1)) + (Fib(1) + Fib(0))) + (F(1) + Fib(0) + Fib(1))
// => 5

// 迭代计算表示上述过程，状态变量的迭代

function fib(n){
	function fib_iter(a,b,count){
		if(count === 0) return b
		return fib_iter(a+b, a, count - 1)
	}
	return fib_iter(1, 0, n)
}
console.log(fib(5)) // 5

//计算过程

// fib(5)
// fib_iter(1, 0, 5)
// fib_iter(1, 1, 4)
// fib_iter(2, 1, 3)
// fib_iter(3, 2, 2)
// fib_iter(5, 3, 1)
// fib_iter(8, 5, 0)
// => 5

// 等价于
function fib2(n){
	let a = 1, b = 0, c = n - 1
	for(; c >= 0; c--){
		a = a + b
		b = a - b
	}
	return b
}
console.log(fib2(5)) // 5
