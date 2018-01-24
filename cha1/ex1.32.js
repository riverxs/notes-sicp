// 前面练习的sum和product都是更抽象一般概念accumulate的特殊情况，请写出该函数

// sum和product如下

// 递归计算模式表达求和概念
function sum(term, a, next, b) {
  if (a > b) return 0;
  return term(a) + sum(term, next(a), next, b);
}

// 返回在给定范围中各点的某个函数值的乘积
function product(term, a, next, b) {
  if (a > b) return 1;
  return term(a) * product(term, next(a), next, b);
}

// 抽象上面的函数
function accumulate(combiner, null_value, term, a, next, b) {
  if (a > b) return null_value;
  return combiner(
    term(a),
    accumulate(combiner, null_value, term, next(a), next, b)
  );
}

// 重新定义的sum2
function sum2(term, a, next, b) {
  function combiner(x, y) {
    return x + y;
  }
  return combiner(term(a), accumulate(combiner, 0, term, next(a), next, b));
}

// 重新定义的product2
function product2(term, a, next, b) {
  function combiner(x, y) {
    return x * y;
  }
  return combiner(term(a), accumulate(combiner, 1, term, next(a), next, b));
}

//
//   以下为测试函数  // ^@^ ^@^ ^@^
//

// 基于sum2定义intergerSum
function identify(x) {
  return x;
}

function intergerSum(a, b) {
  function inc(n) {
    return n + 1;
  }

  return sum2(identify, a, inc, b);
}
console.log(intergerSum(1, 100)); // 5050

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

// 测试正确

// ———————————————————————— 分割线 ——————————————————————

// 改写上面的accumulate递归计算为迭代计算模型
function accumulate2(combiner, null_value, term, a, next, b) {
  function iter(a, result) {
    if (a > b) return result;
    return iter(next(a), combiner(result, term(a)));
  }
  return iter(a, null_value);
}

// 根据accumulate2定义的sum3
function sum3(term, a, next, b) {
  function combiner(x, y) {
    return x + y;
  }
  return combiner(term(a), accumulate2(combiner, 0, term, next(a), next, b));
}

// 根据accumulate2定义的product3
function product3(term, a, next, b) {
  function combiner(x, y) {
    return x * y;
  }
  return combiner(term(a), accumulate2(combiner, 1, term, next(a), next, b));
}

//
// 以下为对accumulate2的测试函数  // ^@^ ^@^ ^@^
//

// 基于sum3定义intergerSum

function intergerSum2(a, b) {
  function inc(n) {
    return n + 1;
  }

  return sum3(identify, a, inc, b);
}
console.log(intergerSum2(1, 100)); // 5050

// 用product3定义阶乘

function factorial2(n) {
  function next(x) {
    return x + 1;
  }

  return product3(identify, 1, next, n);
}

// 测试 True
console.log(factorial2(5)); // 120
console.log(factorial2(6)); // 720

// 测试正确
