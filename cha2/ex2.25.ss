; 给出下面各表中取出7的car和cdr组合

(1 3 (5 7) 9)

(define list1 (list 1 3 (list 5 7) 9))
(car (cdr (car (cdr (cdr list1))))) ; 7

((7))

(define list2 (list (list 7)))
(car (car list2)) ;7

(1 (2 (3 (4 (5 (6 7))))))

(define list3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(car (cdr (cdr (cdr (cdr (cdr (cdr list3))))))) ;7
