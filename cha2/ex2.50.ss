; painter transform

(define (transform-painter painter origin corner1 corner2)
	(lambda (frame) 
		(let ((m (frame-coord-map frame)))
			 (let ((new-origin (m origin)))
			 	(painter
			 		(make-frame new-origin
			 				    (sub-vect (m corner1) new-origin)
			 				    (sub-vect (m corner2) new-origin)))))))

; define flip-horiz transform , which can flip the painter in the horiz..

(define (flip-horiz painter)
	(transform-painter painter 
					   (make-vect 1.0 0.0)
					   (make-vect 1.0 1.0)
					   (make-vect 0.0 0.0)))


; 180deg rotate transform with anticlockwise

(define (rotate180 painter)
	(transform-painter painter 
					   (make-vect 1.0 1.0)
					   (make-vect 1.0 0.0)
					   (make-vect 0.0 1.0)))

; 270deg rotate transform with anticlockwise

(define (rotate270 painter)
	(transform-painter painter 
					   (make-vect 1.0 0.0)
					   (make-vect 0.0 0.0)
					   (make-vect 0.0 1.0)))



