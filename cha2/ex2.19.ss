; 换零钱的改进版，使其能处理不同币种的兑换
(define us-coins (list 50 25 10 5 1))

(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (no-more? coins-values)
	(null? coins-values ))

(define (first-denomination coins-values)
	(car coins-values))

(define (except-first-denomination coins-values)
	(cdr coins-values))

(define (cc amount coins-values)
	(cond ((= amount 0) 1)
		  ((or (< amount 0) (no-more? coins-values)) 0)
		  (else 
		  	(+ (cc amount (except-first-denomination coins-values))
		  	   (cc (- amount (first-denomination coins-values)) coins-values)))))

; test 
(cc 100 us-coins) ; 292
(cc 100 uk-coins) ; 104561

(cc 100 (list 25 50 5 10 1)) ; 292
(cc 100 (list 50 20 100 10 2 5 0.5 1)) ; 104561
; 表coin-values 的排列顺序不会影响cc的结果
; 原因：排列的不同并不会影响可换币种总数