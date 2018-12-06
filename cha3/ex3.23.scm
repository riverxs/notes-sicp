; 实现双端队列deque,数据可以从前端或后端插入和删除
; 实现手段和queue类似

(define (make-deque)
    (cons '() '()))

(define (front-ptr deque) (car deque))

(define (rear-ptr deque) (cdr deque))

(define (set-front-ptr! deque item) (set-car! deque item))

(define (set-rear-ptr! deque item) (set-cdr! deque item))

(define (empty-deque? deque) (null? (front-ptr deque)))

(define (front-deque deque)
  (if (empty-deque? deque)
    (error "FRONT called with an empty deque" deque)
    (car (front-deque deque))))

(define (rear-deque deque)
  (if (empty-deque? deque)
    (error "REAR called with an empty deque" deque)
    (car (rear-deque deque))))

(define (front-insert-deque! deque item)
  (let ((new-pair (list item))
        (cond ((empty-deque? deque)
               (set-front-ptr! deque new-pair)
               (set-rear-ptr! deque new-pair)
               (else
                  (set-cdr! new-pair (front-ptr deque))
                  (set-front-ptr! deque new-pair)
                  deque))))))

(define (rear-insert-deque! deque item)
  (let ((new-pair (list item))
      (cond ((empty-deque? deque)
              (set-front-ptr! deque new-pair)
              (set-rear-ptr! deque new-pair)
              (else
                (set-cdr! (rear-ptr deque) new-pair)
                (set-rear-ptr! deque new-pair)
                deque))))))


(define (front-delete-deque! deque)
  (cond ((empty-deque? deque)
          (error "DELETE! called with an empty deque" deque))
          (else
            (set-front-ptr! deque (cdr (front-ptr deque)))
            deque)))

(define (delete-rear-deque! deque)
(define (iter deque lst)
    (cond ((null? (cdr (cdr lst)))
            (set-cdr! lst '())
            (set-rear-ptr! deque lst)
            deque)
          (else
            (iter deque (cdr lst)))))
              (cond ((empty-deque? deque)
                      (error "DELETE-REAR-DEQUE! called with an empty deque" deque))
                    ((null? (cdr (front-ptr deque)))
                      (set-front-ptr! deque '())
                      deque)
                    (else
                      (iter deque (front-ptr deque)))))

