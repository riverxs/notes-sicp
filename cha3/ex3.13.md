练习 3.13 考虑下面的 make-cycle 过程，其中使用了练习 3.12 定义的 last-pair 过程

```scheme
(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x
)
```

画出盒子指针图形，说明下面表达式创建起的 z 的结构

```scheme
(define z (make-cycle (list 'a 'b 'c)))
```

如果我们试着去计算(last-pair z)会发生什么？


盒子指针图形如下：

![](../img/3.13.png)


计算(last-pair z):

因为Z没有结束null指针，会导致无限递归计算