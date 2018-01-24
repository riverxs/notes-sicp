// 将1.32中的accumulate函数进一步抽象，一般化，使其只组合起由给定范围得到的项目里的那些满足特定条件的项

function accumulate(filter, combiner, null_value, term, a, next, b) {
  if (a > b) return null_value;
  if (filter(term(a))) {
    return combiner(
      term(a),
      accumulate(filter, combiner, null_value, term, next(a), next, b)
    );
  } else {
    return accumulate(filter, combiner, null_value, term, next(a), next, b);
  }
}

// 检测一个数是否为素数

function square(x) {
  return x * x;
}

function isPrime(n) {
  function smallest_divisor(n) {
    function find_divisor(n, test_divisor) {
      if (square(test_divisor) > n) return n;
      if (n % test_divisor === 0) return test_divisor;
      return find_divisor(n, test_divisor + 1);
    }
    return find_divisor(n, 2);
  }

  return smallest_divisor(n) == n;
}

// 求出在区间a到b中所有素数之和

// 素数之和
function sum2(term, a, next, b) {
  function combiner(x, y) {
    return x + y;
  }
  return combiner(
    term(a),
    accumulate(isPrime, combiner, 0, term, next(a), next, b)
  );
}

// 基于sum2定义primeIntergerSum
function identify(x) {
  return x;
}

function primeIntergerSum(a, b) {
  function inc(n) {
    return n + 1;
  }

  return sum2(identify, a, inc, b);
}

// 测试 OK
console.log(primeIntergerSum(1, 7)); // 18
console.log(primeIntergerSum(1, 17)); // 59
console.log(primeIntergerSum(1, 100)); // 1061

// --------------------------------- 第二小题分割线 ----------------------------

// 小于n的所有与n互素的正整数(即所有满足GCD(i,n) = 1的整数i<n) 之乘积

// 最大公约数
function gcd(a, b) {
  if (b === 0) return a;
  return gcd(b, a % b);
}

// 项数相乘
function product2(term, a, next, b) {
  function filterTerm(x) {
    return gcd(x, b) === 1;
  }

  function combiner(x, y) {
    return x * y;
  }
  return combiner(
    term(a),
    accumulate(filterTerm, combiner, 1, term, next(a), next, b)
  );
}

function primeIntergerMuti(a, b) {
  function inc(n) {
    return n + 1;
  }

  return product2(identify, a, inc, b);
}

// 测试 OK
console.log(primeIntergerMuti(1, 7)); // 720
console.log(primeIntergerMuti(1, 8)); // 105
console.log(primeIntergerMuti(1, 16)); // 2027025
console.log(primeIntergerMuti(1, 100)); // 4.262528819427711e+62
