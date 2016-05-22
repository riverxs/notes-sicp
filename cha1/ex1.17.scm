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

(define (fast_multi a b)
  (cond ((= b 1) a)
        ((even? b) (fast_multi (double a) (halve b)))
        (else (+ a (fast_multi a (- b 1))))))

;;; 测试

; (fast_multi 7 8) 56
; (fast_multi 25 12) 300
; (fast_multi 123 456) 56088
