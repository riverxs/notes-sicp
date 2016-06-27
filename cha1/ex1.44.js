// repeated 函数，递归计算

var repeated = (f, n) => {
	if (n==1) return f
	return x => {
		return f(repeated(f, n-1)(x))
	}
}

// 平滑函数
const dx = 0.00001
var smooth = f => x => (f(x-dx) + f(x) + f(x + dx))/3

var smooth_n = repeated(smooth(f), n)
