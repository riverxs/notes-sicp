; 返回表里最后一个元素的表
(define (last-pair l)
  (if (null? (cdr l))
      (list (car l))
      ; or (cons (car l) '())
      (last-pair (cdr l))))

; Test

 (last-pair (list 23 72 149 34)) ; (34)

