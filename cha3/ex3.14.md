定义下面过程

```scheme
(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '())
)
```

请解释mystery做了什么?

```
反转 x这个list，比如传入(list 'a 'b 'c 'd) 返回 ('d 'c 'b 'a)这个list
```

假设(define v (list 'a 'b 'c 'd)), 画出V 约束对应盒子指针图形，假定(define w (mystery v)), 画出求值这个表达式后w和v指针图形?

```
表达式求值后W = ('d 'c 'b 'a), 而 v = '()
```
