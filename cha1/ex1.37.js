// 递归计算
function cont_frac(n, d, k) {
	function frac(i) {
		if(i == k) return d(k)
		return d(i) + n(i+1)/frac(i+1)
	}
	return n(1)/frac(1)
}

console.log(cont_frac(i=>1.0, i=>1.0, 1000)) //0.6180339887498948

function good_enough(v1, v2) {
	return Math.abs(v1 - v2) < 0.0001
}

function find_good_k_and_e(f, k){
	var v1 = f(i => 1.0, i => 1.0, k)
	var v2 = f(i => 1.0, i => 1.0, k+1)
	if(good_enough(v1, v2)){
		return k
	}else{
		return find_good_k_and_e(f, k+1)
	}
}
console.log(find_good_k_and_e(cont_frac, 1)) // 10

// ------------------------第二小题--------------------------------
// 将上述计算过程改写(如果递归计算过程，改写迭代计算，反之同样)

// 迭代计算
function cont_frac_iter(n, d, k) {
	function frac_iter(i, result) {
		if(i == k) return result
		return frac_iter(i+1, d(i)+n(i)/result)
	}
	return n(1)/frac_iter(1, 2)
}

console.log(cont_frac_iter(i=>1.0, i=>1.0, 1000)) //0.6180339887498948