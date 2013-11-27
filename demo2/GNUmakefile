PREREQS = link0 link1 link2 link3 link4 link5 link6 link7 link8 link9 link10 link11 link12 link13 link14 link15 link16 link17 link18 link19 link20
define GUILEIO
;; A simple Guile IO library for GNU make
(define MKPORT #f)
(define (mkopen name mode)
   (set! MKPORT (open-file name mode))
   #f)
(define (mkwrite s)
  (display s MKPORT)
  (newline MKPORT)
  #f)
(define (mkclose)
  (close-port MKPORT)
  #f)
#f
endef
# Internalize the Guile IO functions
$(guile $(GUILEIO))

guile: $(PREREQS)
	@$(guile (mkopen "tmp.out" "w")) \
	$(foreach X,$^,$(guile (mkwrite "$(X)"))) \
	$(guile (mkclose))
	$(LINK) < tmp.out
$(PREREQS):
	@echo compiling... $@
