(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (average x y)
  (/ (+ x y) 2.0))

(define (midpoint-segement seg)
  (let ((start (start-segment seg))
        (end (end-segment seg)))
      (make-point (average (x-point start)
                           (x-point end))
                  (average (y-point start)
                           (y-point end)))))


(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define start (make-point 1 2))

(define end (make-point 3 4))

(define seg (make-segment start end))

(define mid (midpoint-segment seg))

(print-point mid) ; (2.0,3.0)

