
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <errno.h>

int getCycles(void){
  clock_t cycles;
  cycles = clock();
  return((int) cycles);
}

int getCPS(void){
  return((int)CLOCKS_PER_SEC);
}

//CODIGO TOMADO DE : http://www.informit.com/articles/article.aspx?p=23618&seqNum=11
//HECHO POR : Mark L. Mitchell and Jeffrey Oldham (OCT 12,2001)
//ADAPTADO POR: Rodrigo Morales y Paul Belches

int gotoSleep (int sleep_time)
{
	 struct timespec tv;
	 /* Construct the timespec from the number of whole seconds... */
	 tv.tv_sec = 0;
	 /* ... and the remainder in nanoseconds. */
	 tv.tv_nsec = sleep_time;
	 
	 while (1)
	 {
	  /* Sleep for the time specified in tv. If interrupted by a
	    signal, place the remaining time left to sleep back into tv. */
	  int rval = nanosleep (&tv, &tv);
	  if (rval == 0)
	   /* Completed the entire sleep time; all done. */
	   return 0;
	  else if (errno == EINTR)
	   /* Interrupted by a signal. Try again. */
	   continue;
	  else 
	   /* Some other error; bail out. */
	   return rval;
	 }
	 return 0;
}


