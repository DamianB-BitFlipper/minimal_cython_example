# Minimal Cython Example

This code showcases a minimal Cython example, useful as a cookie-cutter template to get started quickly with other Cython-related projects. This codebase includes two implementations of the same function, one in pure Cython and the other one bound to a C implementation.

To build the code, run:
```bash
python setup.py build_ext --inplace
pip install -e .
```

To view which lines of code where converted to pure C, run:
```
cython -a equal_A_repeat_B_indices.pyx
```
and view the generated HTML code in a web-browser.
