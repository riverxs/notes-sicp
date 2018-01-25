## cons 的构造函数定义

```scheme
(define (cons x y)
  (let ((new (get-new-pair)))
    (set-car! new x)
    (set-cdr! new y)
  new )  
)
```

练习 3.12

题目略，见 sicp page175...

问？考虑下面交互

```scheme
(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))

z
(a b c d)

(cdr x)
<response>

(define w (append! x y))
w
(a b c d)

(cdr x)
<response>
```

其中缺少的那两个<response>分别是什么？画出盒子指针图形并解释回答

答：

第一个 response: **(b)**

图示：
![](../img/312_1.png)

第二个 response: **(b c d)**

图示:
![](../img/312_2.png)
