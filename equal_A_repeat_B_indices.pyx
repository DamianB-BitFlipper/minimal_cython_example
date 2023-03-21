import numpy as np
cimport numpy as np
cimport cython

np.import_array()

ctypedef np.int32_t int32_t
ctypedef np.uint8_t bool_

cdef extern void equal_A_repeat_B_indices_cimpl(
    int32_t *A,
    size_t A_len,
    int32_t *repeat,
    int32_t *B,
    int32_t *indices,
    bool_ *out
)

@cython.boundscheck(False) # Turn off bounds-checking for entire function
@cython.wraparound(False)  # Turn off negative index wrapping for entire function
def equal_A_repeat_B_indices(
        int32_t[:] A,
        int32_t[:] repeat,
        int32_t[:] B,
        int32_t[:] indices,
        bool_[:] out,
):
    cdef int32_t idx = 0, a_val, n_reps
    for a_i in range(A.shape[0]):
        a_val = A[a_i]
        n_reps = repeat[a_i]        

        for _ in range(n_reps):
            out[idx] = a_val == B[indices[idx]]
            idx += 1

def equal_A_repeat_B_indices_C_only(
        int32_t[:] A,
        int32_t[:] repeat,
        int32_t[:] B,
        int32_t[:] indices,
        bool_[:] out,
):
    # Create a bunch of C pointers of all of the arrays
    # Refer to: https://stackoverflow.com/questions/10718699/convert-numpy-array-to-cython-pointer
    cdef int32_t *_A = <int32_t*> &A[0]
    cdef int32_t *_repeat = <int32_t*> &repeat[0]
    cdef int32_t *_B = <int32_t*> &B[0]
    cdef int32_t *_indices = &indices[0]
    cdef bool_ *_out = &out[0]
    
    equal_A_repeat_B_indices_cimpl(_A, A.shape[0], _repeat, _B, _indices, _out)
