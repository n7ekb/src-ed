#include <omp.h>
#include <stdio.h>

#ifdef _OPENMP

static char versionbuf[16];
static char gitversion[] = VERSIONINFO;

int main()
{
	int tcount = 0;
	char *versionp;

	/* Tell about the version of OpenMP API we're using.
	 * Specification source: www.openmp.org.
	*/
	switch (_OPENMP) {
		case 200805:
			versionp = "3.0 (May 2008)"; break;
		case 201107:
			versionp = "3.1 (Jul 2011)"; break;
		case 201307:
			versionp = "4.0 (Jul 2013)"; break;
		default:
			sprintf(versionbuf, "(%6.6d)", _OPENMP); 
			versionp = versionbuf;
			break;
	}
	printf("Using OpenMP version: %s\n", versionp);
	printf("Program git commit info: %s\n", gitversion);
	printf("Max threads = %d\n", omp_get_max_threads());

#pragma omp parallel
#pragma omp atomic
	tcount++;

#pragma omp parallel
	/* Hello parallel world... */
	printf("Hello OpenMP World from thread %3.3d of %3.3d! (tcount=%d)\n",
		omp_get_thread_num() + 1, omp_get_num_threads(), tcount);
}

#endif
