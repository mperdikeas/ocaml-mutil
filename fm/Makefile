OCAMLC = ocamlc

MOD-IMPL = mutil_general.cmo mutil_list.cmo mutil_prioQueue.cmo mutil_file.cmo
MOD-SIG  = mutil_prioQueue.cmi

LIB = mutil.cma

build:  $(MOD-SIG) $(MOD-IMPL)
	$(OCAMLC) -a *.cmo -o $(LIB)

$(MOD-SIG) : %.cmi : %.mli
	$(OCAMLC) -c $<

%.cmo : %.ml
	$(OCAMLC) -c $<

.PHONY : clean
clean :
	rm -f $(EXE) *.cmo *.cmi *.cma