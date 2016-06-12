;;; 练习1.17的迭代算法

;;; 乘法的加法定义
;;; 原书上multi为*(假设*在语言中没有定义)

(define (multi a b)
  (if(= b 0) 
    0
    (+ a(multi a (- b 1)))))


;;; 上述计算具有相对于b的线性步骤，即O(n)
;;; 现假定除了加法还有double运算(求出一个整数的两倍)，halve运算(将一个偶数除以2)，运用这些运算函数改良上述计算使之只用对数的计算步骤
(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (iter_multi a b)
	fast_iter_multi(a b 0))

;; 引入c状态变量，当b为偶数时，c=c，当b为奇数时，c<=a+c
(define (fast_iter_multi a b c)
  (cond ((= b 0) c)
        ((even? b) (fast_iter_multi (double a) (halve b) c))
        (else (+ a (fast_iter_multi a (- b 1) (+ a c))))))

;;; 测试

; (fast_iter_multi 7 8 0) 56
; (fast_iter_multi 25 12 0) 300
; (fast_iter_multi 123 456 0) 56088
