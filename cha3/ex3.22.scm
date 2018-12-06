; 完成make-queue的过程实现

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
        (define (empty-queue?)
          (null? front-ptr)
        )
        (define (insert-queue! item)
          (cond ((empty-queue?)
                  (let ((init-lsit (list item)))
                    (set! front-ptr init-lsit)
                    (set! rear-ptr init-lsit)
                    front-ptr
                  ))
                  (else
                    (let ((new-item (list item)))
                      (set-cdr! rear-ptr new-item)
                      (set! rear-ptr new-item)
                      front-ptr
                    ))
                  )
        )
        (define (delete-queue!)
          (cond ((empty-queue?)
                (error "an empty queue!!!"))
                (else
                  (set! front-ptr (cdr front-ptr))
                  front-ptr)))
        (define (disptch m)
          (cond ((eq? m 'insert-queue!) insert-queue!)
                ((eq? m 'delete-queue!) delete-queue!)
                ((eq? m empty-queue?) empty-queue?)
                (else (error "unknow operation!!!"))))
      disptch
    )
)

; 使用局部变量演变队列内部数据的变化