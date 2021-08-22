#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <mpi.h>
#include <cgapsio.h>


#define BLOCK_THREH (1<<30)

int read_file(void * * pptr,int64_t *plen,char *name) {
	static FILE *fp = NULL ;
	static char *old_fname = NULL ;
	if((name != old_fname)) {
		if(fp) {
			fclose(fp);
		} else {
			0;
		}
		(fp = fopen(name, "r"));
	} else {
		0;
	}
	fseek(fp, 0, SEEK_END);
	long l = ftell(fp) ;
	((pptr)[0] = malloc(l));
	((plen)[0] = l);
	fseek(fp, 0, SEEK_SET);
	fread((pptr)[0], 1, l, fp);
	return 0 ;
}
int read_one_block_stdio(Gaps_IO_DataFile *pgid,void *ptr,char *file_name,int64_t ts,int64_t num_blocks_one_step_this_file,int64_t bid) {
	FILE *fp = fopen(file_name, "r") ;
	int64_t blk_len = ((pgid)->block_len * GAPS_IO_GetTypeLen((pgid)->type)) ;
	int64_t offset_zero = (sizeof(int64_t) * (3 + ((pgid)->dim * 2))) ;
	fseek(fp, (offset_zero + (blk_len * (bid + (num_blocks_one_step_this_file * ts)))), SEEK_SET);
	fread(ptr, 1, blk_len, fp);
	fclose(fp);
	return 0 ;
}
int read_one_block(void *ptr,char *base_file_name,char *prefix,int64_t ts,int64_t fid,int64_t bid) {
	Gaps_IO_DataFile gid ;
	Gaps_IO_DataFile *pgid = & (gid) ;
	GAPS_IO_InitIFileV2(pgid, base_file_name, prefix, fid);
	GAPS_IO_DataSeek(pgid, ts, (bid * (pgid)->block_len));
	GAPS_IO_FRead(pgid, ptr, (pgid)->block_len);
	GAPS_IO_DeleteDataInfo(pgid);
	return 0 ;
}
int obtain_pname_and_rank(char *pName,int *prank,char *pNameAll) {
	int alllen = strlen(pNameAll) ;
	int l ;
	for((l = (alllen - 1)) ; (l >= 0) ; (l = (l + -1))) {
		if(((pNameAll)[l] == '_')) {
			break;
		} else {
			0;
		}
	}{
		long i ;
		for((i = 0) ; (i < (l - 5)) ; (i = (i + 1))) {
			((pName)[i] = (pNameAll)[i]);
		}
	}
	((pName)[(l - 5)] = 0);
	sscanf((pNameAll + (l + 1)), "%d", prank);
	return 0 ;
}
int main(int argc,char * * argv) {
	MPI_Init(& (argc), & (argv));
	Gaps_IO_DataFile gi ;
	Gaps_IO_DataFile *pgi = & (gi) ;
	Gaps_IO_DataFile go ;
	Gaps_IO_DataFile *pgo = & (go) ;
	if((argc < 3)) {
		fprintf(stderr, "Usage: %s infile(s) outfile\n", (argv)[0]);
		return 0 ;
	} else {
		0;
	}
	((pgi)->version = 2);
	char oriname [512];
	{
		int rank ;
		obtain_pname_and_rank(oriname, & (rank), (argv)[1]);
		GAPS_IO_InitIFileV2(pgi, oriname, "", rank);
	}
	if((2 != (pgi)->version)) {
		fprintf(stderr, "File %s is not version 2\n", (argv)[1]);
	} else {
		0;
	}
	int64_t version = pgi->version ;
	int64_t type = pgi->type ;
	int64_t dim = pgi->dim ;
	int64_t *pdimarray = pgi->pdimarray ;
	int64_t *pblockarray = pgi->pblockarray ;
	int64_t numperstep = pgi->numperstep ;
	int typelen = GAPS_IO_GetTypeLen(type) ;
	int64_t *poutlen = malloc((sizeof(int64_t) * dim)) ;
	int64_t oneblock_len = 1 ;
	int64_t numblocks = 1 ;
	{
		long g ;
		for((g = 0) ; (g < dim) ; (g = (g + 1))) {
			((poutlen)[g] = ((pdimarray)[g] * (pblockarray)[g]));
			(oneblock_len = (oneblock_len * (pdimarray)[g]));
			(numblocks = (numblocks * (pblockarray)[g]));
		}
	}
	int num_files = (argc - 2) ;
	int64_t * * meta_data = malloc((num_files * sizeof(int64_t *))) ;
	int64_t *meta_data_len = malloc((num_files * sizeof(int64_t))) ;
	int64_t *file_id = malloc((sizeof(int64_t) * numblocks)) ;
	int64_t *local_block_id = malloc((sizeof(int64_t) * numblocks)) ;
	{
		long i ;
		for((i = 1) ; (i < (argc - 1)) ; (i = (i + 1))) {
			long cur_i = (i - 1) ;
			fprintf(stderr, "Checking %s\n", (argv)[i]);
			char meta_file_name [512];
			strncpy(meta_file_name, (argv)[i], 512);
			int l = strlen(meta_file_name) ;
			int sj = 0 ;
			{
				long j ;
				for((j = 0) ; (j < l) ; (j = (j + 1))) {
					if(((meta_file_name)[(l - (1 + j))] == '_')) {
						(sj = ((l - (1 + j)) - 4));
						break;
					} else {
						0;
					}
				}
			}
			memcpy((meta_file_name + sj), "META", 4);
			read_file((meta_data + cur_i), (meta_data_len + cur_i), meta_file_name);
			((meta_data_len)[cur_i] = ((meta_data_len)[cur_i] / sizeof(int64_t)));
			{
				long j ;
				for((j = 0) ; (j < (meta_data_len)[cur_i]) ; (j = (j + 1))) {
					int64_t local_id_m = ((meta_data)[cur_i])[j] ;
					((file_id)[local_id_m] = cur_i);
					((local_block_id)[local_id_m] = j);
				}
			}
		}
	}
	int64_t numsteps = 0 ;
	int64_t numresd = 0 ;
	GAPS_IO_DataNumStepsAndResidue(pgi, & (numsteps), & (numresd));
	char *display_steps = "GAPS_IO_DISPLAY_NUM_STEPS" ;
	char *uds = getenv(display_steps) ;
	fprintf(stderr, "0x%lx 0x%lx\n", display_steps, uds);
	if((uds && (strcmp(uds, "1") == 0))) {
		fprintf(stdout, "%d\n", numsteps);
		exit(0);
	} else {
		0;
	}
	char *min_env_str = "GAPS_IO_MIN_TIME_STEP" ;
	char *max_env_str = "GAPS_IO_MAX_TIME_STEP" ;
	char *output_offset_str = "GAPS_IO_OUTPUT_OFFSET_TIME_STEP" ;
	char *min_numt = getenv(min_env_str) ;
	char *max_numt = getenv(max_env_str) ;
	char *output_offset_numt = getenv(output_offset_str) ;
	long t_min = 0 ;
	long t_max = numsteps ;
	if(min_numt) {
		sscanf(min_numt, "%ld", & (t_min));
	} else {
		0;
	}
	fprintf(stderr, "t_min=%d ns=%d\n", t_min, numsteps);
	if((t_min >= numsteps)) {
		exit(0);
	} else {
		0;
	}
	(t_min = ((t_min + numsteps) % numsteps));
	if(max_numt) {
		sscanf(max_numt, "%ld", & (t_max));
	} else {
		0;
	}
	long t_opt_offset = t_min ;
	if(output_offset_numt) {
		sscanf(output_offset_numt, "%ld", & (t_opt_offset));
	} else {
		0;
	}
	(t_max = (((t_max + (numsteps + -1)) % numsteps) + 1));
	fprintf(stderr, "tmin=%d tmax=%d topt=%d\n", t_min, t_max,t_opt_offset);
	GAPS_IO_InitDataInfo(pgo, type, dim, poutlen);
	GAPS_IO_InitOFile_with_TimeStep(pgo, (argv)[(argc - 1)], (((t_min- t_opt_offset==0))?(-1):(t_min-t_opt_offset)));
	int64_t opt_write_block = 1 ;
	int64_t opt_read_block = oneblock_len ;
	int dim_current = 0 ;
	for(0 ; (dim_current < dim) ; (dim_current = (dim_current + 1))) {
		(opt_write_block = (opt_write_block * (poutlen)[dim_current]));
		(opt_read_block = (opt_read_block * (pblockarray)[dim_current]));
		if((opt_read_block > BLOCK_THREH)) {
			(opt_write_block = (opt_write_block / (poutlen)[dim_current]));
			(opt_read_block = (opt_read_block / (pblockarray)[dim_current]));
			break;
		} else {
			0;
		}
	}
	int64_t one_write_offset = 1 ;
	{
		long i ;
		for((i = 0) ; (i < dim_current) ; (i = (i + 1))) {
			(one_write_offset = (one_write_offset * (poutlen)[i]));
		}
	}
	int64_t one_write_stride_num = (one_write_offset * (((dim_current < dim))?((pdimarray)[dim_current]):(1))) ;
	int64_t num_reads_per_step = ((pgo)->numperstep / opt_read_block) ;
	int64_t num_blocks_per_read = (opt_read_block / oneblock_len) ;
	int64_t num_writes_per_read = (opt_read_block / opt_write_block) ;
	char *read_block_buffer = malloc((opt_read_block * typelen)) ;
	char *read_one_block_buffer = malloc((oneblock_len * typelen)) ;
	int64_t *pblkid = malloc((sizeof(int64_t) * dim)) ;
	int64_t *plocalid = malloc((sizeof(int64_t) * dim)) ;
	int64_t *pallid = malloc((sizeof(int64_t) * dim)) ;
	int64_t *palldim = malloc((sizeof(int64_t) * dim)) ;
	int64_t *pallid_local = malloc((sizeof(int64_t) * dim)) ;
	int64_t *palldim_local = malloc((sizeof(int64_t) * dim)) ;
	{
		long t ;
		for((t = t_min) ; (t < t_max) ; (t = (t + 1))) {
			{
				long b_rd ;
				for((b_rd = 0) ; (b_rd < num_reads_per_step) ; (b_rd = (b_rd + 1))) {
					int64_t global_offset_new = 0 ;
					{
						long r_rd ;
						for((r_rd = 0) ; (r_rd < num_blocks_per_read) ; (r_rd = (r_rd + 1))) {
							int64_t bid_all = (r_rd + (num_blocks_per_read * b_rd)) ;
							read_one_block_stdio(pgi, read_one_block_buffer, (argv)[(1 + (file_id)[bid_all])], t, (meta_data_len)[(file_id)[bid_all]], (local_block_id)[bid_all]);
							{
								int64_t gid = bid_all ;
								{
									long tmpids ;
									for((tmpids = 0) ; (tmpids < dim) ; (tmpids = (tmpids + 1))) {
										((pblkid)[tmpids] = (gid % (pblockarray)[tmpids]));
										(gid = (gid / (pblockarray)[tmpids]));
									}
								}
							}{
								long l ;
								for((l = 0) ; (l < oneblock_len) ; (l = (l + 1))) {
									{
										long gid = l ;
										{
											long tmpids ;
											for((tmpids = 0) ; (tmpids < dim) ; (tmpids = (tmpids + 1))) {
												((plocalid)[tmpids] = (gid % (pdimarray)[tmpids]));
												(gid = (gid / (pdimarray)[tmpids]));
											}
										}
									}{
										long a ;
										for((a = 0) ; (a < dim) ; (a = (a + 1))) {
											((pallid)[a] = ((plocalid)[a] + ((pdimarray)[a] * (pblkid)[a])));
											((palldim)[a] = ((pdimarray)[a] * (pblockarray)[a]));
											((pallid_local)[a] = (((a < dim_current))?(((plocalid)[a] + ((pdimarray)[a] * (pblkid)[a]))):((plocalid)[a])));
											((palldim_local)[a] = (((a < dim_current))?(((pdimarray)[a] * (pblockarray)[a])):((pdimarray)[a])));
										}
									}
									int64_t global_id_out = ({
										int64_t gid = 0 ;
										int64_t stride_len = 1 ;
										{
											long tmpids ;
											for((tmpids = 0) ; (tmpids < dim) ; (tmpids = (tmpids + 1))) {
												(gid = (gid + ((pallid)[tmpids] * stride_len)));
												(stride_len = (stride_len * (palldim)[tmpids]));
											}
										} gid;
									}) ;
									if(((l == 0) && (r_rd == 0))) {
										(global_offset_new = global_id_out);
									} else {
										0;
									}
									int64_t global_id = ({
										int64_t gid = 0 ;
										int64_t stride_len = 1 ;
										{
											long tmpids ;
											for((tmpids = 0) ; (tmpids < dim) ; (tmpids = (tmpids + 1))) {
												(gid = (gid + ((pallid_local)[tmpids] * stride_len)));
												(stride_len = (stride_len * (palldim_local)[tmpids]));
											}
										} gid;
									}) ;
									memcpy((read_block_buffer + (global_id * typelen)), (read_one_block_buffer + (l * typelen)), typelen);
									int data = (((double *)read_block_buffer))[global_id] ;
								}
							}
						}
					}{
						long w_rd ;
						for((w_rd = 0) ; (w_rd < num_writes_per_read) ; (w_rd = (w_rd + 1))) {
							int64_t offset = (global_offset_new + (w_rd * one_write_offset)) ;
							GAPS_IO_DataSeek(pgo, (t - t_opt_offset), offset);
							GAPS_IO_FWrite(pgo, (read_block_buffer + (w_rd * (opt_write_block * typelen))), opt_write_block);
						}
					}
				}
			}
			fprintf(stderr, "t=%d done\n", t);
		}
	}
	free(pblkid);
	free(plocalid);
	free(pallid);
	free(palldim);
	free(pallid_local);
	free(palldim_local);
	free(read_block_buffer);
	free(read_one_block_buffer);
	GAPS_IO_DeleteDataInfo(pgo);
	GAPS_IO_DeleteDataInfo(pgi);
	MPI_Finalize();
}
