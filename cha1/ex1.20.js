// 求最大公约数(欧几里得算法)
// 该算法基于观察：GCD(a, b) = GCD(b, r) r=a%b
 
function gcd(a, b) {
	if(b===0) return a
	return gcd(b, a%b)
}

console.log(gcd(12,32)) // 4

