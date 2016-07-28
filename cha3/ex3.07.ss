; 3.3

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

(define (make-joint account match-password new-password)
	)

(define peter-acc (make-account 100 'open-sesame))

(define paul-acc
	(make-joint peter-acc 'open-sesame 'rosebud))






