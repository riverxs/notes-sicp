function double(f) {
  return x => f(f(x));
}

function inc(x) {
  return x + 1;
}

console.log(double(inc)(1)); //3

console.log(double(double(double))(inc)(5)); //21
