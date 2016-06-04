var compose = (f, g) => x => f(g(x))

var square = x => x*x

var inc = x => x+1

console.log(compose(square, inc)(6)) // 49