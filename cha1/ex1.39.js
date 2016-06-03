// 练习1.39
function cont_frac(n, d, k) {
	function frac(i) {
		if(i == k) return d(k)
		return d(i) - n(i+1)/frac(i+1)
	}
	return n(1)/frac(1)
}


function tan_cf(x, k) {
	function N(i) {
		if(i==1) return x
		return x*x
	}

	function D(i) {
		return 2*i -1
	}

	return cont_frac(N, D, k)
}

// 测试
console.log(Math.tan(Math.PI/4)) //   0.9999999999999999
console.log(tan_cf(Math.PI/4, 100)) //1

console.log(Math.tan(Math.PI/6)) //    0.5773502691896257
console.log(tan_cf(Math.PI/6, 100)) // 0.5773502691896257

