说明下面过程的错误，该过程计算列表的序对个数

```scheme
(define (count-pairs x)
  (if (not (pairs? x))
    0
    (+ (count-pairs (car x))
       (count-pairs (cdr x))
       1))
)
```

