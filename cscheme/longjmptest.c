/* longjmp example */
#include <stdio.h>      /* printf */
#include <setjmp.h>     /* jmp_buf, setjmp, longjmp */

main()
{
  jmp_buf env;
  int val;

  printf ("before jmp\n");
  val=setjmp(env);

  printf ("val is %d\n",val);

  if (!val) longjmp(env, 1);

  return 0;
}
