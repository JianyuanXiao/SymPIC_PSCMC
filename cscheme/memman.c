/*
 ============================================================================
 Name        : memman.c
 Author      : xiao
 Version     :
 Copyright   : 
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "define_types.h"
int alloc_once=512;
int realloc_times=16;
int stack_len=1048576;

#define CALC_FLOOR_ALLOC_ONCE(x) (((x)/alloc_once+1)*alloc_once)


int init_matlab_like_data_array(matlab_like_data_array * mlda,int el){
	mlda->data=NULL;
	mlda->num_alloced=0;
	mlda->element_length=el;
	mlda->realloc_times=0;
	mlda->num_elements=0;
	return 0;
}

int delete_mlda(matlab_like_data_array * mlda){
	free(mlda->data);
	mlda->data=NULL;
	mlda->num_elements=0;
	mlda->num_alloced=0;
	return 0;
}

int get_array_ele(matlab_like_data_array * mlda,size_t id,void * output){
	if(id>=mlda->num_elements){
		return 1;
	}else{
		memcpy(output,mlda->data+id*mlda->element_length,mlda->element_length);
	}
	return 0;
}

int set_array_ele(matlab_like_data_array * mlda,size_t id,void * input){
	if(id>=mlda->num_alloced){
		void * tmpdata=NULL;
		if(mlda->realloc_times<realloc_times){
			tmpdata=realloc(mlda->data,(CALC_FLOOR_ALLOC_ONCE(id))*mlda->element_length);
		}
		if(tmpdata!=NULL){
			mlda->data=tmpdata;
			mlda->num_alloced=CALC_FLOOR_ALLOC_ONCE(id);
			mlda->realloc_times++;
		}else{
			int alloc_dbl=2;
			if(id*mlda->element_length>=stack_len){
				alloc_dbl=4;
			}
			tmpdata=malloc(2*(CALC_FLOOR_ALLOC_ONCE(id)*mlda->element_length));
			assert(tmpdata);
			memcpy(tmpdata,mlda->data,mlda->element_length*mlda->num_elements);
			free(mlda->data);
			mlda->data=tmpdata;
			mlda->num_alloced=2*CALC_FLOOR_ALLOC_ONCE(id);
			mlda->realloc_times=0;

		}

	}
	if(mlda->num_elements<=id){
		memset(mlda->data+mlda->num_elements*mlda->element_length,0,(id-mlda->num_elements)*mlda->element_length);
		mlda->num_elements=id+1;
	}
	memcpy(mlda->data+id*mlda->element_length,input,mlda->element_length);
	return 0;
}
int dump_int_mlda(matlab_like_data_array * mlda){
	int i;
	for(i=0;i<mlda->num_elements;i++){
		printf("%d\n",((int*)(mlda->data))[i]);
	}
	printf("num_elements=%d\n",(int)mlda->num_elements);
	printf("alloced_elements=%d\n",(int)mlda->num_alloced);
	return 0;
}
