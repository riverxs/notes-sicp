当解释器打印出 ((a b) b) 的时候，实际上是将 q1 变量的 car 和 cdr 部分都打印了出来，其中 car 的部分指向 (a b) ，而 cdr 部分指向 b

正确的打印版本

```scheme
(define (print-queue queue)
  (car queue)
)
```


