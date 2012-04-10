ifdef OPT
	OCAMLC = ocamlopt
	MOD-IMPL = mutil_general.cmx mutil_list.cmx mutil_prioQueue.cmx mutil_file.cmx
	LIB = mutil.cmxa
else
	OCAMLC = ocamlc
	MOD-IMPL = mutil_general.cmo mutil_list.cmo mutil_prioQueue.cmo mutil_file.cmo
	LIB = mutil.cma
endif



MOD-SIG  = mutil_prioQueue.cmi



$(LIB):  $(MOD-SIG) $(MOD-IMPL)
	$(OCAMLC) -a $(MOD-IMPL) -o $(LIB)

$(MOD-SIG) : %.cmi : %.mli
	$(OCAMLC) -c $<

%.cmo %.cmx: %.ml
	$(OCAMLC) -c $<

deploy: $(LIB)
	cp $(LIB) ../mutil-deploy



.PHONY : clean deploy
clean :
	rm -f $(EXE) *.cmo *.cmi *.cma *.cmx *.cmxa *.a *.o

clean-deploy:
	rm -f ../mutil-deploy/*