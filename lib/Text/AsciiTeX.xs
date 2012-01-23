#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <asciiTeX.h>

SV* render (SV* eq) {
  int ll=80;
  int i, cols, rows;
  char **screen;
  SV* ret = newRV_noinc((SV*)newAV());

  screen = asciiTeX(SvPV_nolen(eq), ll, &cols, &rows);

  for (i = 0; i < rows; i++)
  {
	av_push((AV *)SvRV(ret), newSVpvf("%s", screen[i]));
	free(screen[i]);
  }
  free(screen);

  return ret;
}

MODULE = Text::AsciiTeX		PACKAGE = Text::AsciiTeX	

PROTOTYPES: DISABLE

SV *
render (eq)
	SV*	eq

