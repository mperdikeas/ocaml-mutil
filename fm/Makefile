OCAMLC = ocamlc

MOD-IMPL = general.cmo listUtil.cmo prioQueue.cmo
MOD-SIG  = prioQueue.cmi

LIB = fm.cma

build:  $(MOD-SIG) $(MOD-IMPL)
	$(OCAMLC) -a *.cmo -o $(LIB)

$(MOD-SIG) : %.cmi : %.mli
	$(OCAMLC) -c $<

%.cmo : %.ml
	$(OCAMLC) -c $<

.PHONY : clean
clean :
	rm -f $(EXE) *.cmo *.cmi *.cma