#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#define NEED_newRV_noinc
#define NEED_sv_2pv_flags
#include "ppport.h"

#include "asciiTeX.h"

/* prevents collision of free() with Perl's free() in XS */
#include "MyFree.h"

SV* c_render (SV* eq, int ll) {
  int i, cols, rows;
  char **screen;
  AV* ret = newAV();

  screen = asciiTeX(SvPV_nolen(eq), ll, &cols, &rows);

  for (i = 0; i < rows; i++)
  {
	if (cols<0)
		warn("%s\n", screen[i]);
	else
		av_push(ret, newSVpvf("%s", screen[i]));
	MyFree(screen[i]);
  }
  MyFree(screen);

  return newRV_noinc((SV*)ret);
}

MODULE = Text::AsciiTeX		PACKAGE = Text::AsciiTeX	

PROTOTYPES: DISABLE

SV *
c_render (eq, ll)
	SV*	eq
	int	ll

