(define (flsp0 x) (quasiquote (* -1 (+ (* -1 (A 0 0 2 2 2)) (A 1 0 2 2 2)) (pow DT -1))))
(define (flsp1 x) (quasiquote (* (pow DT -1) (+ (A 0 1 2 2 2) (* -1 (A 1 1 2 2 2)) (* (+ (IB 0 2 1 2 2 0) (IB 1 2 2 2 2 0)) DT)))))
(define (flsp2 x) (quasiquote (* -1 (pow DT -1) (+ (* -1 (A 0 2 2 2 2)) (A 1 2 2 2 2) (* (+ (* -1 (IB 0 0 1 1 2 1)) (IB 0 1 1 2 2 0) (* -1 (IB 1 0 3 2 2 1)) (IB 1 1 2 2 2 0)) DT)))))
(define (flsp3 x) (quasiquote (+ (IB 1 1 3 3 2 2) (IB 1 1 3 3 3 2) (* -1 (IB 1 2 3 2 2 1)) (* -1 (IB 1 2 3 3 4 1)))))
(define (flsp4 x) (quasiquote (+ (* -1 (IB 1 0 3 3 2 2)) (* -1 (IB 1 0 3 3 3 2)))))
(define (flsp5 x) (quasiquote 0))