// 函数 f 由如下规则定义：
// 当n < 3, 那么f(n) = n; 当n>=3, 那么f(n) = f(n-1) + 2f(n-2) + 3f(n-3)
// 写出递归计算过程和迭代计算过程？

// 递归计算

function f(n) {
	if(n<3) return n
	return f(n-1) + 2*f(n-2) + 3*f(n-3)
}

for(var i=0; i<=5; i++){
	console.log(f(i))
}

// 0
// 1
// 2
// 4
// 11
// 25

// 迭代计算

// 引入状态变量a,b,c,迭代次数count; 初值 a=2 b=1 c=0, count = n-2

// 下次迭代
// a<= a + 2b + 3c

// b<= a

// c<= b

// 再下次迭代
// a<= a + 2b + 3c
// ....

function f2(n) {
	if(n<3) return n
	function iter(a, b, c, count) {
		if(count == 0) return a
		return iter(a+2*b+3*c, a, b, count-1)
	}
	return iter(2,1,0,n-2)
}


for(var i=0; i<=5; i++){
	console.log(f2(i))
}

// 0
// 1
// 2
// 4
// 11
// 25
