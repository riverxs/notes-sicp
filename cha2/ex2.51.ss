; below

(define (below painter1 painter2)
	(let ((split-point (make-vect 0.0 0.5)))
		(let ((paint-top
			  (transform-painter painter2
			  					 split-point
			  					 (make-vect 0.0 1.0)
			  					 (make-vect 1.0 0.5)))
			  (paint-bottom
			  (transform-painter painter1
			  					 (make-vect 0.0 0.0)
			  					 (make-vect 1.0 0.0)
			  					 split-point)))
		(lambda (frame)
			(paint-top frame)
			(paint-bottom frame)))))


; 由beside适当旋转得来

(define (beside painter1 painter2)
	(let ((split-point (make-vect 0.5 0.0)))
		(let ((paint-left
			  (transform-painter painter1
			  					 (make-vect 0.0 0.0)
			  					 split-point
			  					 (make-vect 0.0 1.0)))
			  (paint-right
			  (transform-painter painter2
			  					 split-point
			  					 (make-vect 1.0 0.0)
			  					 (make-vect 0.5 1.0))))
		(lambda (frame)
			(paint-left frame)
			(paint-right frame)))))

; 改造beside

(define (rotate90 painter)
	(transform-painter painter 
					   (make-vect 1.0 0.0)
					   (make-vect 1.0 1.0)
					   (make-vect 0.0 0.0)))


(define (rotate180 painter)
	(transform-painter painter 
					   (make-vect 1.0 1.0)
					   (make-vect 1.0 0.0)
					   (make-vect 0.0 1.0)))


(define (beside2 painter1 painter2)
	(let ((split-point (make-vect 0.5 0.0)))
		(let ((paint-left
			  (transform-painter painter1
			  					 (make-vect 0.0 0.0)
			  					 split-point
			  					 (make-vect 0.0 1.0)))
			  (paint-right
				(rotate180 			  
					(transform-painter painter2
			  					 split-point
			  					 (make-vect 1.0 0.0)
			  					 (make-vect 0.5 1.0)))))
		(lambda (frame)
			(paint-left frame)
			(paint-right frame)))))


(define (below painter1 painter2)
	(rotate90 (beside2 painter1 painter2)))

