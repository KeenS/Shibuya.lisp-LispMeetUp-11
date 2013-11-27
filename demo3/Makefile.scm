(use-modules (ice-9 format))
(define-syntax deftask
  (syntax-rules ()
    ((_ name deps
	...)
     (begin
       (gmk-eval (format #f ".PHONY: ~a" (quote name)))
       (gmk-eval (format #f "~a:~{ ~a~}~@{~&~/~{~a ~}~}" (quote name) (quote deps) ...))))))

(deftask default (dep1 DEP2)
  (@echo "This is default"))

(deftask dep1 ()
  (@echo "This is dep1"))
(deftask dep2 ()
  (@echo "This is dep2"))
(deftask DEP2 ()
  (@echo "This is DEP2"))
