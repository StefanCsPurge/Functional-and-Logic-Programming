; 7. Return the level of a node X in a tree of type (1). The level of the root element is 0.
; Example: (A 2  B 0  C 2 D 0 E 0)
; Mathematical model
;                             | ∅ if the list is empty
; parcurg_st(L1...Ln,nv,nm) = | ∅ if nv = 1 + nm
;                             | L1 ⊕ L2 ⊕ parcurg_st(L3...Ln,nv+1,mn+L2) otherwise

(defun parcurg_st(arb nv nm)
    (cond
        ((null arb) nil)
        ((= nv (+ 1 nm)) nil)
        (t (cons (car arb) (cons (cadr arb) (parcurg_st (cddr arb) (+ 1 nv) (+ (cadr arb) nm)))))
    )
)

(defun stang(arb)
    (parcurg_st (cddr arb) 0 0)
)

; Mathematical model
;                             | ∅ if the list is empty
; parcurg_dr(L1...Ln,nv,nm) = | L1...Ln if nv = 1 + nm
;                             | parcurg_dr(L3...Ln,nv+1,mn+L2) otherwise

(defun parcurg_dr(arb nv nm)
    (cond
        ((null arb) nil)
        ((= nv (+ 1 nm)) arb)
        (t (parcurg_dr (cddr arb) (+ 1 nv) (+ (cadr arb) nm)))
    )
)

(defun drept(arb)
    (parcurg_dr (cddr arb) 0 0)
)

; return false in case the node was not found
; Mathematical model
;                                   | false if the list is empty
; count_level(L1...Ln,node,level) = | level if L1 = node 
;                                   | count_level(stang(L1...Ln),node,level+1) if node in stang(L1...Ln)
;                                   | count_level(drept(L1...Ln),node,level+1) otherwise

(defun count_level (arb node lvl)
    (cond 
        ((null arb) nil)
        ((eq (car arb) node) lvl)
        (T
            (SETQ left_check (count_level (stang arb) node (+ 1 lvl)))
            (cond
               ((numberp left_check) left_check)
               (T (count_level (drept arb) node (+ 1 lvl)))    
            ) 
        )
    )
)

(defun get_level(arb node)
    (count_level arb node 0)
)