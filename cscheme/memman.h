#include "define_types.h"
int init_matlab_like_data_array(matlab_like_data_array * mlda,int el)
;
int delete_mlda(matlab_like_data_array * mlda)
;
int get_array_ele(matlab_like_data_array * mlda,size_t id,void * output)
;
int set_array_ele(matlab_like_data_array * mlda,size_t id,void * input)
;
int dump_int_mlda(matlab_like_data_array * mlda)
;
