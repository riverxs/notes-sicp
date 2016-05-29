; 对于每个表达式解释器会输出什么结果？

10 ;  10

(+ 5 3 4) ;  12

(- 9 1) ; 8

(/ 6 2) ; 3

(+ (* 2 4) (- 4 6)) ; 6

(define a 3) ; a=3

(define b (+ a 1)) ;  Exception: variable a is not bound  表达的意思是: b=a+1

(+ a b (* a b)) ;   Exception: variable b is not bound 表达的意思是:a+b+a*b

(= a b) ;   Exception: variable b is not bound   表达的意思是:return #t or #f
 
(if (and (> b a) (< b (* a b)))
	b
	a)  
;  Exception: variable b is not bound  表达的意思是: return b or a

(cond ((= a 4) 6)
	  ((= b 4) (+ 6 7 a))
	  (else 25))

; 表达的意思是: 如果a=4,则返回6；如果b=4, 返回13+a; 否则返回25

(+ 2 (if (> b a) b a)) ; 表达的意思是: 如果b>a,返回2+b; 否则返回 2+a

(* (cond ((> a b) a)
		 ((< a b) b)
		 (else -1))
   (+ a 1))

; 表达的意思是: 如果a>b,返回a*(a+1); 如果a<b,返回b*(a+1); 否则返回-a-1