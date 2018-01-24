// 返回在给定范围中各点的某个函数值的乘积
function product(term, a, next, b) {
  if (a > b) return 1;
  return term(a) * product(term, next(a), next, b);
}

function identify(x) {
  return x;
}

// 用product定义阶乘
function factorial(n) {
  function next(x) {
    return x + 1;
  }

  return product(identify, 1, next, n);
}

// 测试 True
console.log(factorial(5)); // 120
console.log(factorial(6)); // 720

// 按下列公式计算π/4

// π/4 = (2*4*4*6*6*8...)/(3*3*5*5*7*7...)
// @param {number} n 越大pi 越精确

function getPi(n) {
  function next(x) {
    return x + 2;
  }

  function term1(x) {
    return x / (x + 1);
  }

  function term2(x) {
    return (x + 1) / x;
  }

  return product(term1, 2, next, n) * product(term2, 3, next, n - 1);
}

console.log(4 * getPi(1000)); // 3.14002381860059
console.log(4 * getPi(10000)); // 3.14143559358987
// console.log(4*getPi(100000)) // RangeError: Maximum call stack size exceeded

// 从上可看这是一个递归计算过程，调用栈很快就满了

// 改写成迭代计算模型

function product2(term, a, next, b) {
  function iter(a, result) {
    if (a > b) return result;
    return iter(next(a), result * term(a));
  }
  return iter(a, 1);
}

// 用product2定义阶乘
function factorial(n) {
  function next(x) {
    return x + 1;
  }

  return product2(identify, 1, next, n);
}

// 测试 True
console.log(factorial(5)); // 120
console.log(factorial(6)); // 720

// 计算π/4
function getPi(n) {
  function next(x) {
    return x + 2;
  }

  function term1(x) {
    return x / (x + 1);
  }

  function term2(x) {
    return (x + 1) / x;
  }

  return product2(term1, 2, next, n) * product2(term2, 3, next, n - 1);
}
console.log(4 * getPi(1000)); // 3.14002381860059
console.log(4 * getPi(10000)); // 3.14143559358987
console.log(4 * getPi(100000)); //stack overflow ==> no tail recursion optimization
console.log(4 * getPi(1000000)); //stack overflow ==> no tail recursion optimization
