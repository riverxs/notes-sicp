(load 'ex2.46.ss') ; import the frame-coord-map and make-vect function from ex2.46.ss
(load 'ex2.47.ss') ; import the start-segment、end-segment and make-segment from ex2.47.ss
(load 'ex2.23.ss') ; import the for-each from ex2.23.ss

(define (segments->painter segment-list)
	(lambda (frame)
		(for-each
			(lambda (segment)
				; 假设存在基本绘图接口draw-line
				(draw-line
					((frame-coord-map frame) (start-segment segment))
					((frame-coord-map frame) (end-segment segment))))
			segment-list)))

; 根据segment->painter 定义下列画家

; (1) : 给定框架边界的画家

; 点pointer
(define lb (make-vect 0 0))
(define lt (make-vect 0 1))
(define rb (make-vect 1 0))
(define rt (make-vect 1 1))

;段segment
(define ls (make-segment lb lt))
(define ts (make-segment lt rt))
(define rs (make-segment rt rb))
(define bs (make-segment lb rb))

; segment-list
(define edge-segments (list ls ts rs bs))

(define edge-painter (segments->painter edge-segments))

; (2) : 对角线连接大叉子画家

; segment
(define lb-rt (make-segment lb rt))
(define lt-rb (make-segment lt rb))

; segment-list
(define fork-segments (list lb-rt lt-rb))

(define fork-painter (segments->painter fork-segments))


; (3) : 连接中点的菱形画家

; middle pointers
(define tm (make-vect 0.5 1))
(define rm (make-vect 1 0.5))
(define bm (make-vect 0.5 0))
(define lm (make-vect 0 0.5))

; middle segments
(define l2t (make-segment lm tm))
(define l2b (make-segment lm bm))
(define b2r (make-segment bm rm))
(define r2t (make-segment rm tm))

; segment-list
(define rhombus-segments (list l2t l2b b2r r2t))

(define rhombus-painter (segments->painter rhombus-segments))

; (4) : 画家wave

; pointer is too much !!!

