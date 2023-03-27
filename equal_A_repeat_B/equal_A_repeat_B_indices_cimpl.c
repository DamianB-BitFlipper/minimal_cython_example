#include <stdint.h>
#include <stddef.h>

#define VECTORIZE_INTERVAL  64

typedef unsigned char bool;

void equal_A_repeat_B_indices_cimpl(int32_t *A,
				    size_t A_len,
				    int32_t *repeat,
				    int32_t *B,
				    int32_t *indices,
				    bool *out) {
  uint32_t idx = 0;
  
  for(uint32_t a_i = 0; a_i < A_len; a_i++) {
    uint32_t a_val = A[a_i];
    uint32_t n_reps = repeat[a_i];

    for(uint32_t i = 0; i < n_reps; i++) {
      uint32_t b_val = B[indices[idx]];
      out[idx] = (a_val == b_val);
      idx++;
    }
  }

  return;
}
