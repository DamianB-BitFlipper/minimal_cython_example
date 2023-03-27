.DEFAULT_GOAL := all

profile:
	cython -a equal_A_repeat_B/equal_A_repeat_B_indices.pyx

build:
	python setup.py build_ext --inplace

install: build
	pip install -e .

clean:
	python setup.py clean --all

uninstall:
	pip uninstall equal_A_repeat_B

all: build install
