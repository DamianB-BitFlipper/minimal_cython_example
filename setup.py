from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize
import numpy as np

e = Extension(
    "equal_A_B",
    sources=[
        "equal_A_repeat_B_indices.pyx",
        "equal_A_repeat_B_indices_cimpl.c",
    ],
    include_dirs=[np.get_include()],
    extra_compile_args=["-O3"],
)

setup(
    ext_modules = cythonize([e])
)
