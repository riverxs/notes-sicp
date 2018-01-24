var tolerance = 0.00001;
// 求f的不动点
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

// 过程作为返回值

// 将平均阻尼这一一般性的技术表述为函数

function averageDamp(f) {
  return x => (x + f(x)) / 2;
}

// 利用average_dramp重写求平方根sqrt,即求y=x/y的不动点

function sqrt(x) {
  return fixedPoint(averageDamp(y => x / y), 1.0);
}
console.log(sqrt(2)); // 1.4142135623746899

// 将平方根过程推广为一个求立方根的过程，即求y=x/y^2的不动点

function cubeRoot(x) {
  return fixedPoint(averageDamp(y => x / (y * y)), 1.0);
}

console.log(cubeRoot(27)); // 2.9999972321057697

// 从上可以看出用函数将一般性的函数返回可作为去形式化其他具体函数，从而让一般性的函数具有可重用性，而不必每次需要用到该模式都需具体显式的应用该一般模式，只需调用就可生成具体过程

// 即是将计算过程中有用的元素抽象成一些相互分离的个体(函数)，并使它们重新用于其他地方

// 牛顿法

// 如果x=>g(x)是一个可微函数，那么方程g(x)=0的一个解就是函数x=>f(x)的不动点

// 描述导数概念

var dx = 0.00001;
// deriv :: Function -> Function
function deriv(g) {
  return x => (g(x + dx) - g(x)) / dx;
}

// 将g(x)转变成f(x)
// newtonTransform :: Function -> Function
function newtonTransform(g) {
  return x => x - g(x) / deriv(g)(x);
}

// 求不动点
function newtonsMethod(g, guess) {
  return fixedPoint(newtonTransform(g), guess);
}

// 通过牛顿法找函数y=>y^2 -x的零点

function sqrt(x) {
  return newtonsMethod(y => y * y - x, 1.0);
}

// 抽象和第一级过程(函数作为first-class)

// 何为第一级？
/*
0. 总的来说就是带有最少限制的元素被称为具有第一级的状态
1. 也就是说函数和String，Number等数据类型具有同等地位

// first-class 的“特权”
1. 可以用变量命名，即用变量来引用
2. 当做函数的参数
3. 作为函数的返回值
4. 可以包含在数据结构中
*/

// 找出函数在变换后的不动点

function fixedPointOfTransform(g, transform, guess) {
  return fixedPoint(transform(g), guess);
}

// 实例1. 搜寻y => x/y 在平均阻尼下的不动点

function sqrtByAvergeDamp(x) {
  return fixedPointOfTransform(y => x / y, averageDamp, 1.0);
}
console.log(sqrtByAvergeDamp(2)); // 1.4142135623746899

// 实例2. 牛顿法搜寻y => y^2 -x 的零点

function sqrtByNewtonMethod(x) {
  return fixedPointOfTransform(y => y * y - x, newtonTransform, 1.0);
}
console.log(sqrtByNewtonMethod(2)); // 1.4142135623746899
