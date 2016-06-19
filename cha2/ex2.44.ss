; 图形语言的基本原语：画家（painter）

; 组合手段及抽象手段：
; beside 
; (从两个painter出发，产生一个复合型画家，第一个painter在框架左边，第二个painter在框架右边) ，

; below 
; (同样从两个painter出发，产生一个复合型画家，第一个在第二个之下)

; flip-vert
;(从一个画家出发，将该画家所画图像上下颠倒画出的画家) 

; flip-horiz
; (产生的painter将原painter的图像左右反转后画出)

; 如
(define wave2 (beside wave (flip-vert wave)))

(define wave4 (below wave2 wave2))

; 将wave4的模式抽取出来作为过程
(define (flipped-pairs painter)
	(let ((painter2 (beside painter (flip-vert painter))))
		 (below painter2 painter2)))

(define (right-split painter n)
	(if (= n 0)
		painter
		(let ((smaller (right-split painter (- n 1))))
			 (beside painter (below smaller smaller)))))

(define (corner-split painter n)
	(if (= n 0)
		painter
		(let ((up (up-split painter (-n 1)))
			  (right (right-split painter (- n 1))))
		(let ((top-left (beside up up))
			  (bottom-right (below right right))
			  (corner (corner-split painter (- n 1))))
		   (beside (below painter top-left)
		   		   (below bottom-right corner))))))

; 将corner-split的四个拷贝适当组合成square-limit
(define (square-limit painter n)
	(let ((quarter (corner-split painter n)))
		(let ((half (beside (flip-horiz quarter) quarter)))
			(below (flip-vert half) half))))

; 2.44, 定义corner-split里使用的up-split

; 和right-split大同小异

(define (up-split painter n)
	(if (= n 0)
		painter
		(let ((smaller (up-split painter (- n 1))))
			 (below painter (beside smaller smaller)))))

