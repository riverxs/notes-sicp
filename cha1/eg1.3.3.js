// 过程作为一般性的方法

// 通过区间折半寻找方程的根, 给定函数f(x),在定点a和b有f(a)<0<f(b),那么f在a和b之间必有一个零点

function search(f, negPoint, posPoint) {
  function closeEnough(x, y) {
    return Math.abs(x - y) < 0.001;
  }
  var midPoint = (negPoint + posPoint) / 2;

  if (closeEnough(negPoint, posPoint)) {
    return midPoint;
  } else {
    var testValue = f(midPoint);
    if (testValue === 0) return midPoint;
    else if (testValue < 0) return search(f, midPoint, posPoint);
    else return search(f, negPoint, midPoint);
  }
}

// 如果f(x)的根不在f(a),f(b)范围内，那我们就不能用该方法求方程的根并需要给出错误提示

function halfIntervalMethod(f, a, b) {
  if (f(a) * f(b) > 0) {
    throw new Error("Values are not of opposite sign");
  } else {
    return search(f, a, b);
  }
}

console.log(search(Math.sin, 2.0, 4.0));
console.log(halfIntervalMethod(Math.sin, 2.0, 4.0));
console.log(halfIntervalMethod(x => x * x * x - 2 * x - 3, 1.0, 2.0)); // 1.89306640625

// 寻找函数的不动点，如果x满足方程f(x) = x, 对某些函数，从初始值出发，反复地应用f, f(x), f(f(x)), f(f(f(x))).....，直到值的变化不大时，该值就可作为函数的不动点

var tolerance = 0.00001;

function fixedPoint(f, firstGuess) {
  function closeEnough(v1, v2) {
    return Math.abs(v1 - v2) < tolerance;
  }
  function tryFixed(guess) {
    var next = f(guess);
    if (closeEnough(guess, next)) {
      return next;
    }
    return tryFixed(next);
  }
  return tryFixed(firstGuess);
}

// 求余弦的不动点
console.log(fixedPoint(Math.cos, 1.0)); //0.7390822985224023

// x=sinx + cosx 的解（不动点）
console.log(fixedPoint(x => Math.sin(x) + Math.cos(x), 1.0)); //1.2587315962971173

// 求平方根，即y=x/y的不动点
function sqrt(x) {
  return fixedPoint(y => x / y, 1.0);
}
// console.log(sqrt(2)) //Uncaught RangeError: Maximum call stack size exceeded

// 上述y=x/y的不动点并不收敛，改进办法：即求y=(y+x/y)/2的不动点

function sqrt2(x) {
  return fixedPoint(y => (y + x / y) / 2, 1.0);
}

console.log(sqrt2(2)); //1.4142135623746899

// 求黄金分割值
console.log(fixedPoint(x => 1 + 1 / x, 2.0)); // 1.6180327868852458
