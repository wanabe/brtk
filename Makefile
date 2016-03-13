RAKEOPT :=
RAKE = ruby ./minirake $(RAKEOPT)

all :
	$(RAKE)
.PHONY : all

test : all
	$(RAKE) test
.PHONY : test

clean :
	$(RAKE) clean
.PHONY : clean
