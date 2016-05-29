// 素数检测

// 检测一个数是否为素数

function square(x) {
	return x*x
}

function isPrime(n) {
	function smallest_divisor(n) {
		function find_divisor(n, test_divisor){
			if(square(test_divisor) > n) return n
			if(n%test_divisor === 0) return test_divisor
			return find_divisor(n, test_divisor + 1)
		}
		return find_divisor(n, 2)
	}

	return smallest_divisor(n) == n
}

// 求出在区间a到b中所有素数之和