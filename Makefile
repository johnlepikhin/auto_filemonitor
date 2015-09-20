
.oasis:
	oasis setup

.configure:
	ocaml setup.ml -configure --bindir ~/bin/

.build:
	ocaml setup.ml -build

.clean: .oasis
	ocaml setup.ml -distclean

all: .oasis .clean .configure .build

install: all
	ocaml setup.ml -install
