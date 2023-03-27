from setuptools import setup, find_packages, Extension
from Cython.Build import cythonize
import numpy as np

e = Extension(
    "equal_A_repeat_B",
    sources=[
        "./equal_A_repeat_B/equal_A_repeat_B_indices.pyx",
        "./equal_A_repeat_B/equal_A_repeat_B_indices_cimpl.c",
    ],
    include_dirs=[np.get_include()],
    extra_compile_args=["-O3"],
)

setup(
    name="equal_A_repeat_B",
    license="MIT",
    packages=find_packages(),
    ext_modules = cythonize([e])
)
