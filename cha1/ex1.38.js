function cont_frac(n, d, k) {
	function frac(i) {
		if(i == k) return d(k)
		return d(i) + n(i+1)/frac(i+1)
	}
	return n(1)/frac(1)
}

// Di
function D(i) {
	if((i+1)%3 == 0){
		return 2*(i+1)/3
	}else{
		return 1
	}
}

function find_good_k(f, k){
	function goodEnough(v1, v2) {
		return Math.abs(v1 - v2) < 0.0001
	}
	var v1 = f(i => 1.0, D, k) + 2
	var v2 = f(i => 1.0, D, k+1) + 2
	if(goodEnough(v1, v2)){
		return k+" counts and e≈"+ v1 
	}else{
		return find_good_k(f, k+1)
	}
}

console.log(find_good_k(cont_frac, 1)) // 7 counts and e≈2.7183098591549295
