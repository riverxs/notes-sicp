(define (make-monitored f)
	(let ((count 0))
		(lambda (val)
			(cond ((eq? val 'how-many-calls?) count)
				  ((eq? val 'reset-count)
				  	(begin (set! count 0) count))
				  (else (begin (set! count (+ count 1)) (f val)))))))

(define s (make-monitored sqrt))

(s 100) ;10

(s 'how-many-calls?) ;1

(s 25) ; 5

(s 'how-many-calls?) ; 2

(s 16) ;4

(s 'how-many-calls?); 3

(s 'reset-count) ; 0

(s 'how-many-calls?) ; 0
