(define (flr0 x) (quasiquote (* -5.00000000000000000e-01 Mass (+ (* 2.00000000000000000e+00 (pow DELTAT -2) (+ (* -1.00000000000000000e+00 X1) X2)) (* -1.00000000000000000e+00 (pow Tori_X0 -1) (pow DELTAT -2) (+ 1.00000000000000000e+00 (* (pow Tori_X0 -1) (+ (* 5.00000000000000000e-01 (+ X1 X2)) XO))) (pow (+ (* -1.00000000000000000e+00 Y1) Y2) 2))) (* (pow (+ 1.00000000000000000e+00 (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 X1) X2) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ 1.00000000000000000e+00 (* (pow Tori_X0 -1) (+ (* 5.00000000000000000e-01 (+ X1 X2)) XO))) 2) (pow (+ (* -1.00000000000000000e+00 Y1) Y2) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 Z1) Z2) 2))) -1.00000000000000000e+00) (sqrt (+ 1.00000000000000000e+00 (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 X1) X2) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ 1.00000000000000000e+00 (* (pow Tori_X0 -1) (+ (* 5.00000000000000000e-01 (+ X1 X2)) XO))) 2) (pow (+ (* -1.00000000000000000e+00 Y1) Y2) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 Z1) Z2) 2))))))))
(define (flr1 x) (quasiquote (+ (* Charge Ex1) (* Charge (pow DELTAT -1) (+ (B0z_inty X1 Y0 Z0 Y1) (* -1.00000000000000000e+00 (B0y_intz X1 Y1 Z0 Z1)))) (* -5.00000000000000000e-01 Mass (+ (* -2.00000000000000000e+00 (pow DELTAT -2) (+ (* -1.00000000000000000e+00 X0) X1)) (* -1.00000000000000000e+00 (pow Tori_X0 -1) (pow DELTAT -2) (+ 1.00000000000000000e+00 (* (pow Tori_X0 -1) (+ (* 5.00000000000000000e-01 (+ X0 X1)) XO))) (pow (+ (* -1.00000000000000000e+00 Y0) Y1) 2))) (* (pow (+ 1.00000000000000000e+00 (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 X0) X1) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ 1.00000000000000000e+00 (* (pow Tori_X0 -1) (+ (* 5.00000000000000000e-01 (+ X0 X1)) XO))) 2) (pow (+ (* -1.00000000000000000e+00 Y0) Y1) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 Z0) Z1) 2))) -1.00000000000000000e+00) (sqrt (+ 1.00000000000000000e+00 (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 X0) X1) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ 1.00000000000000000e+00 (* (pow Tori_X0 -1) (+ (* 5.00000000000000000e-01 (+ X0 X1)) XO))) 2) (pow (+ (* -1.00000000000000000e+00 Y0) Y1) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 Z0) Z1) 2)))))))))
(define (flr2 x) (quasiquote (+ (* -5.00000000000000000e-01 Mass (pow RPL20 -1) (+ (* 2.00000000000000000e+00 (pow DELTAT -2)) (* -5.00000000000000000e-01 (pow Tori_X0 -2) (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 Y1) Y2) 2)))) (* 2.50000000000000000e-01 Mass (pow RPL20 -3) (+ (* -2.00000000000000000e+00 (pow DELTAT -2) (+ (* -1.00000000000000000e+00 X1) X2)) (* -1.00000000000000000e+00 (pow Tori_X0 -1) (pow DELTAT -2) RPL00 (pow (+ (* -1.00000000000000000e+00 Y1) Y2) 2))) (+ (* 2.00000000000000000e+00 (pow DELTAT -2) (+ (* -1.00000000000000000e+00 X1) X2)) (* -1.00000000000000000e+00 (pow Tori_X0 -1) (pow DELTAT -2) RPL00 (pow (+ (* -1.00000000000000000e+00 Y1) Y2) 2)))))))
(define (flr3 x) (quasiquote (+ (* -1.00000000000000000e+00 Charge (pow DELTAT -1) (B1z_intx_x X1 Y1 Z1 X2)) (* -1.00000000000000000e+00 Mass (pow Tori_X0 -1) (pow DELTAT -2) RPL00 (pow RPL20 -1) (+ (* -1.00000000000000000e+00 Y1) Y2)) (* 5.00000000000000000e-01 Mass (pow DELTAT -2) (pow RPL00 2) (pow RPL20 -3) (+ (* -1.00000000000000000e+00 Y1) Y2) (+ (* -2.00000000000000000e+00 (pow DELTAT -2) (+ (* -1.00000000000000000e+00 X1) X2)) (* -1.00000000000000000e+00 (pow Tori_X0 -1) (pow DELTAT -2) RPL00 (pow (+ (* -1.00000000000000000e+00 Y1) Y2) 2)))))))
(define (flr4 x) (quasiquote (+ (* Charge (pow DELTAT -1) (+ (B1y_intx_x X1 Y1 Z1 X2) (* -1.00000000000000000e+00 (B1x_inty_x X2 Y1 Z1 Y2)))) (* 5.00000000000000000e-01 Mass (pow DELTAT -2) (pow RPL20 -3) (+ (* -2.00000000000000000e+00 (pow DELTAT -2) (+ (* -1.00000000000000000e+00 X1) X2)) (* -1.00000000000000000e+00 (pow Tori_X0 -1) (pow DELTAT -2) RPL00 (pow (+ (* -1.00000000000000000e+00 Y1) Y2) 2))) (+ (* -1.00000000000000000e+00 Z1) Z2)))))
(define (flr5 x) (quasiquote (+ (* -1.00000000000000000e+00 Charge (pow DELTAT -1) (B1z_intx X1 Y1 Z1 X2)) (* -1.00000000000000000e+00 Mass (pow DELTAT -2) (pow (+ 1.00000000000000000e+00 (* (pow Tori_X0 -1) (+ (* 5.00000000000000000e-01 (+ X1 X2)) XO))) 2) (+ (* -1.00000000000000000e+00 Y1) Y2) (* (pow (+ 1.00000000000000000e+00 (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 X1) X2) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ 1.00000000000000000e+00 (* (pow Tori_X0 -1) (+ (* 5.00000000000000000e-01 (+ X1 X2)) XO))) 2) (pow (+ (* -1.00000000000000000e+00 Y1) Y2) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 Z1) Z2) 2))) -1.00000000000000000e+00) (sqrt (+ 1.00000000000000000e+00 (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 X1) X2) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ 1.00000000000000000e+00 (* (pow Tori_X0 -1) (+ (* 5.00000000000000000e-01 (+ X1 X2)) XO))) 2) (pow (+ (* -1.00000000000000000e+00 Y1) Y2) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 Z1) Z2) 2)))))))))
(define (flr6 x) (quasiquote (+ (* Charge Ey1) (* Charge (pow DELTAT -1) (B0x_intz X1 Y1 Z0 Z1)) (* Mass (pow DELTAT -2) (pow (+ 1.00000000000000000e+00 (* (pow Tori_X0 -1) (+ (* 5.00000000000000000e-01 (+ X0 X1)) XO))) 2) (+ (* -1.00000000000000000e+00 Y0) Y1) (* (pow (+ 1.00000000000000000e+00 (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 X0) X1) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ 1.00000000000000000e+00 (* (pow Tori_X0 -1) (+ (* 5.00000000000000000e-01 (+ X0 X1)) XO))) 2) (pow (+ (* -1.00000000000000000e+00 Y0) Y1) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 Z0) Z1) 2))) -1.00000000000000000e+00) (sqrt (+ 1.00000000000000000e+00 (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 X0) X1) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ 1.00000000000000000e+00 (* (pow Tori_X0 -1) (+ (* 5.00000000000000000e-01 (+ X0 X1)) XO))) 2) (pow (+ (* -1.00000000000000000e+00 Y0) Y1) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 Z0) Z1) 2)))))))))
(define (flr7 x) (quasiquote (+ (* 1.00000000000000000e+00 Mass (pow Tori_X0 -1) (pow DELTAT -2) RPL00 (pow RPL20 -1) (+ (* -1.00000000000000000e+00 Y1) Y2)) (* -5.00000000000000000e-01 Mass (pow DELTAT -2) (pow RPL00 2) (pow RPL20 -3) (+ (* -1.00000000000000000e+00 Y1) Y2) (+ (* 2.00000000000000000e+00 (pow DELTAT -2) (+ (* -1.00000000000000000e+00 X1) X2)) (* -1.00000000000000000e+00 (pow Tori_X0 -1) (pow DELTAT -2) RPL00 (pow (+ (* -1.00000000000000000e+00 Y1) Y2) 2)))))))
(define (flr8 x) (quasiquote (+ (* -1.00000000000000000e+00 Mass (pow DELTAT -2) (pow RPL00 2) (pow RPL20 -1)) (* -1.00000000000000000e+00 Mass (pow DELTAT -4) (pow RPL00 4) (pow RPL20 -3) (pow (+ (* -1.00000000000000000e+00 Y1) Y2) 2)))))
(define (flr9 x) (quasiquote (+ (* -1.00000000000000000e+00 Charge (pow DELTAT -1) (B1x_inty_y X2 Y1 Z1 Y2)) (* -1.00000000000000000e+00 Mass (pow DELTAT -4) (pow RPL00 2) (pow RPL20 -3) (+ (* -1.00000000000000000e+00 Y1) Y2) (+ (* -1.00000000000000000e+00 Z1) Z2)))))
(define (flr10 x) (quasiquote (+ (* Charge (pow DELTAT -1) (+ (B1y_intx X1 Y1 Z1 X2) (* -1.00000000000000000e+00 (B1x_inty X2 Y1 Z1 Y2)))) (* -1.00000000000000000e+00 Mass (pow DELTAT -2) (+ (* -1.00000000000000000e+00 Z1) Z2) (* (pow (+ 1.00000000000000000e+00 (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 X1) X2) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ 1.00000000000000000e+00 (* (pow Tori_X0 -1) (+ (* 5.00000000000000000e-01 (+ X1 X2)) XO))) 2) (pow (+ (* -1.00000000000000000e+00 Y1) Y2) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 Z1) Z2) 2))) -1.00000000000000000e+00) (sqrt (+ 1.00000000000000000e+00 (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 X1) X2) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ 1.00000000000000000e+00 (* (pow Tori_X0 -1) (+ (* 5.00000000000000000e-01 (+ X1 X2)) XO))) 2) (pow (+ (* -1.00000000000000000e+00 Y1) Y2) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 Z1) Z2) 2)))))))))
(define (flr11 x) (quasiquote (+ (* Charge Ez1) (* Mass (pow DELTAT -2) (+ (* -1.00000000000000000e+00 Z0) Z1) (* (pow (+ 1.00000000000000000e+00 (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 X0) X1) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ 1.00000000000000000e+00 (* (pow Tori_X0 -1) (+ (* 5.00000000000000000e-01 (+ X0 X1)) XO))) 2) (pow (+ (* -1.00000000000000000e+00 Y0) Y1) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 Z0) Z1) 2))) -1.00000000000000000e+00) (sqrt (+ 1.00000000000000000e+00 (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 X0) X1) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ 1.00000000000000000e+00 (* (pow Tori_X0 -1) (+ (* 5.00000000000000000e-01 (+ X0 X1)) XO))) 2) (pow (+ (* -1.00000000000000000e+00 Y0) Y1) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 Z0) Z1) 2)))))))))
(define (flr12 x) (quasiquote (* -5.00000000000000000e-01 Mass (pow DELTAT -2) (pow RPL20 -3) (+ (* 2.00000000000000000e+00 (pow DELTAT -2) (+ (* -1.00000000000000000e+00 X1) X2)) (* -1.00000000000000000e+00 (pow Tori_X0 -1) (pow DELTAT -2) RPL00 (pow (+ (* -1.00000000000000000e+00 Y1) Y2) 2))) (+ (* -1.00000000000000000e+00 Z1) Z2))))
(define (flr13 x) (quasiquote (* -1.00000000000000000e+00 Mass (pow DELTAT -4) (pow RPL00 2) (pow RPL20 -3) (+ (* -1.00000000000000000e+00 Y1) Y2) (+ (* -1.00000000000000000e+00 Z1) Z2))))
(define (flr14 x) (quasiquote (+ (* -1.00000000000000000e+00 Mass (pow DELTAT -2) (pow RPL20 -1)) (* -1.00000000000000000e+00 Mass (pow DELTAT -4) (pow RPL20 -3) (pow (+ (* -1.00000000000000000e+00 Z1) Z2) 2)))))
(define (flr15 x) (quasiquote (+ 1.00000000000000000e+00 (* (pow Tori_X0 -1) (+ (* 5.00000000000000000e-01 (+ X1 X2)) XO)))))
(define (flr16 x) (quasiquote (* (pow DELTAT -2) (pow RPL00 2) (pow (+ (* -1.00000000000000000e+00 Y1) Y2) 2))))
(define (flr17 x) (quasiquote (* (pow (+ 1.00000000000000000e+00 (* -1.00000000000000000e+00 RPL10) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 X1) X2) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 Z1) Z2) 2))) 0.00000000000000000e+00) (sqrt (+ 1.00000000000000000e+00 (* -1.00000000000000000e+00 RPL10) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 X1) X2) 2)) (* -1.00000000000000000e+00 (pow DELTAT -2) (pow (+ (* -1.00000000000000000e+00 Z1) Z2) 2)))))))