#ifndef ELE_TYPES_DEFINED
#define ELE_TYPES_DEFINED
typedef enum {CONT,READPOINTNUM,READPOINT}rmodes;
typedef enum {	NONE,TWO_NODE_LINE,THREE_NODE_TRIANGLE,
		FOUR_NODE_QUADRANGLE,
		FOUR_NODE_TETRAHEDRON,EIGHT_NODE_HEXAHEDRON,
		SIX_NODE_PRISM,FIVE_NODE_PYRAMID,
		THREE_NODE_SECOND_ORDER_LINE,
		SIX_NODE_SECONDE_ORDER_TRIANGLE,
		NINE_NODE_SECOND_ORDER_QUADRANGLE,
		TEN_NODE_SECOND_ORDER_TETRAHEDRON,
		TWENTYSEVEN_NODE_SECOND_ORDER_HEXAHEDRON,
		EIGHTEEN_NODE_SECOND_ORDER_PRISM,
		FOURTEEN_NODE_SECOND_ORDER_PYRAMID,
		ONE_NODE_POINT,
		EIGHT_NODE_SECOND_ORDER_QUADRANGLE,
		TWENTY_NODE_SECOND_ORDER_HEXAHEDRON}element_types;

typedef int GE_INT_TYPE ;
typedef int NODE_ID_INT;
typedef double NODE_ID_FLOAT;

#define MAX_NODE_ID 8
#define MAX_TAGS 8

typedef struct {
	int element_id;
	element_types et;
	int numtags;
	int tags[MAX_TAGS];
	int numnodes;
	int node_id[MAX_NODE_ID];
}general_element;
#define TYPE_MALLOC(x,len) x=malloc(sizeof(*x)*len)

typedef struct {
	int num_nodes;
	int *node_id;
	double * x;
	double * y;
	double * z;
}nodes;
typedef struct {
	int element_length;
	size_t num_alloced;
	size_t num_elements;
	int realloc_times;
	void * data;
}matlab_like_data_array;

typedef struct {
	matlab_like_data_array mlda;
	element_types et;
}type_elements_array;
#define TYPE_ELEMENTS_ARRAY_CLASS_HEADER(x) matlab_like_data_array mlda=(x)->mlda;element_types et=(x)->et;
#define MAX_SPARSE_DENSE 64
typedef struct {
	int node_id[MAX_SPARSE_DENSE];
	double num_eval_x[3*MAX_SPARSE_DENSE];
	double num_eval_y[3*MAX_SPARSE_DENSE];
	double num_eval_z[3*MAX_SPARSE_DENSE];
	int num_ids;
}sparse_nodes;

typedef int (*linear_operator_omp) (double ** ,double **);

typedef struct{
	int len;
	double**r;
	double**w;
	double**v;
	double**u;
	double**ic;
	linear_operator_omp A;
	double solve_err;
	//double iC;
	int zmax;
}pc_cg_space;

typedef struct{
	pc_cg_space CGS;
	double ** MAT0A0;
	double ** MAT1A1;
	int stable;
	linear_operator_omp MAT0;
	linear_operator_omp MAT1;
	linear_operator_omp MAT2;
}maxwell_iter_qubic_space;
#define MAXWELL_ITER_QUBIC_SPACE_CLASS_HEADER(x) pc_cg_space CGS=(x)->CGS;double ** MAT0A0=(x)->MAT0A0;double ** MAT1A1=(x)->MAT1A1;int stable=(x)->stable;linear_operator_omp MAT0=(x)->MAT0;linear_operator_omp MAT1=(x)->MAT1
#define MAX_ITER 1000



#endif //ELE_TYPES_DEFINED
