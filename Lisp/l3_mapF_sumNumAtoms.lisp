; 2. Write a function that returns the sum of numeric atoms in a list, at any level. 
; Solve it using map functions.
; Mathematical model:
;          | x if x is a number
; sum(x) = | 0 if x is a non-numerical atom
;          | Σ_i=1,n sum(x_i) otherwise

(defun sum(x)
    (cond
        ((numberp x) x)
        ((atom x) 0)
        (T (apply #' +(mapcar #' sum x)))
    )
)

(format t "The sum of the numeric atoms is:")
(print (sum '(1 a (2 C 3) 6 (A (B 5) 2) 5)))
    
    
        
    
        
    




