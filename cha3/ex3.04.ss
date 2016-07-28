; 密码连续不正确访问将警告！！！
(define (make-account balance password count)
	(define (withdraw amount)
		(if (>= balance amount)
			(begin (set! balance (- balance amount)) balance)
			"balance is poor"))

	(define (deposit amount)
		(set! balance (+ balance amount))
		balance)

	(define (call-the-cops)(display "WARNING,the cops is coming"))

	(define (dispatch pass m)
		(cond ((eq? pass password)
			(set! count 7)
			(cond ((eq? m 'withdraw) withdraw)
				  ((eq? m 'deposit) deposit)))
			(else (if (= count 1)
				(call-the-cops)
				(begin (set! count (- count 1)) count)))))
	dispatch)

;test

(define acc (make-account 100 'river 7))

((acc 'river 'withdraw) 40) ; 60

; 连续输入错误密码

(acc 'r 'deposit) ;6

(acc 'i 'deposit)  ;5

(acc 'v 'withdraw) ;4

(acc 'e 'deposit) ;3

(acc 'r 'withdraw) ;2

(acc 'x 'deposit) ;1

(acc 's 'deposit)  ;WARNING,the cops is coming

; 不连续

(acc 'r 'deposit) ;6

(acc 'i 'deposit)  ;5

(acc 'v 'withdraw) ;4

((acc 'river 'deposit) 50) ;110

(acc 'r 'withdraw) ;6

(acc 'i 'deposit) ;5

(acc 'x 'deposit) ;4

(acc 's 'deposit) ;3
