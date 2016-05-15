// 用递归计算过程描述帕斯卡三角形(杨辉三角)
// 形如下列形状,外围三角边界上的数都是1，内部的每个数是位于它上面的两个数之和

//     1
//    1 1
//   1 2 1
//  1 3 3 1
// 1 4 6 4 1
//    ...

function pascalTriangle(i, j) {
	if(i===j || j===0) return 1
	return pascalTriangle(i-1, j-1) + pascalTriangle(i-1, j)
}

for(var i=0; i<6; i++) {
	for(var j=0; j<=i; j++){
		console.log(pascalTriangle(i, j))
	}
}

// 计算结果如下
// 1
// 1
// 1
// 1
// 2
// 1
// 1
// 3
// 3
// 1
// 1
// 4
// 6
// 4
// 1
// 1
// 5
// 10
// 10
// 5
// 1
