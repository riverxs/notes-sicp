; 闭包+消息传递
(define (make-account balance password)
	(define (withdraw amount)
		(if (>= balance amount)
			(begin (set! balance (- balance amount)) balance)
			"balance is poor"))
	(define (deposit amount)
		(set! balance (+ balance amount))
		balance)
	(define (dispatch pass m)
		(if (eq? pass password)
			(cond ((eq? m 'withdraw) withdraw)
				  ((eq? m 'deposit) deposit))
			(display "Incorrect password")))
	dispatch)

;test

(define acc (make-account 100 'river))

((acc 'river 'withdraw) 40) ; 60

((acc 'xs 'deposit) 50) ; Incorrect password

((acc 'river 'deposit) 50) ; 110

