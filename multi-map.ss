(define (multi-map fun . args)
  (cond 
    ((null? args) '())
    ((null? (cdr args)) (apply map (cons fun args)))
    (else 
      (apply append (apply multi-map (cons (lambda y (map (lambda (x) (apply fun (cons x y))) (car args))) (cdr args))))
      )
    ))

