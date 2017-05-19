From: "Cufi, Carles" <Carles.Cufi-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
Subject: RE: [PATCH v2] Makefile: Fix build on MSYS2 and Cygwin
Date: Fri, 19 May 2017 08:59:12 +0000
Message-ID: <df8de8dbf8b6437ca6118397f8c0ce0a@nordicsemi.no>
References: <cd57ad6bd43f413eafdef078cc895432@nordicsemi.no>
 <20170519061722.GH12284@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170519061722.GH12284-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: "david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org" <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jdl-CYoMK+44s/E@public.gmane.org" <jdl-CYoMK+44s/E@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Hi David

> -----Original Message-----
> From: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:devicetree-
> compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
> Sent: Friday, May 19, 2017 08:17
> To: Cufi, Carles <Carles.Cufi-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
> Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; jdl-CYoMK+44s/E@public.gmane.org; Andy Gross
> <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Subject: Re: [PATCH v2] Makefile: Fix build on MSYS2 and Cygwin
> 
> On Tue, May 16, 2017 at 08:30:45AM +0000, Cufi, Carles wrote:
> > The host compiler on MSYS2 and Cygwin does not allow the -fPIC option,
> > issuing a warning that is treated as an error and stops the build.
> > Detect whether we're running under MSYS2 or Cygwin and avoid adding
> > -fPIC to prevent the error from happening.
> >
> > Signed-off-by: Carles Cufi <carles.cufi-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
> 
> Thanks for reworking, but this is still really more convoluted than I
> had in mind.  I've just applied a preliminary cleanup patch to my git
> tree, re-organizing the variables with both the compile time and link
> time shared library options.
> 
> I'm hoping on top of that what I want will be more obvious - you should
> be able to just add a single ifeq stanza alongside the existing one for
> darwin.

Thanks for your input and help. I will send a new patch in a moment based on your latest changes.

Regards,

Carles


> 
> > ---
> >  Makefile | 19 ++++++++++++-------
> >  1 file changed, 12 insertions(+), 7 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index beca4a0..7ac343d 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -18,7 +18,7 @@ CONFIG_LOCALVERSION =  CPPFLAGS = -I libfdt -I .
> >  WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
> >  	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
> > -CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
> > +CFLAGS = -g -Os -Werror $(WARNINGS)
> >
> >  BISON = bison
> >  LEX = flex
> > @@ -33,14 +33,19 @@ LIBDIR = $(PREFIX)/lib  INCLUDEDIR =
> > $(PREFIX)/include
> >
> >  HOSTOS := $(shell uname -s | tr '[:upper:]' '[:lower:]' | \
> > -	    sed -e 's/\(cygwin\).*/cygwin/')
> > +		sed -e 's/\(cygwin\|msys\).*/\1/')
> > +
> > +ifneq ($(HOSTOS),$(filter $(HOSTOS),msys cygwin)) COMPILE_OPTIONS +=
> > +-fPIC SHAREDLIB_LINK_OPTIONS += -fPIC endif
> >
> >  ifeq ($(HOSTOS),darwin)
> >  SHAREDLIB_EXT=dylib
> > -SHAREDLIB_LINK_OPTIONS=-dynamiclib -Wl,-install_name -Wl,
> > +SHAREDLIB_LINK_OPTIONS +=-dynamiclib -Wl,-install_name -Wl,
> >  else
> >  SHAREDLIB_EXT=so
> > -SHAREDLIB_LINK_OPTIONS=-shared -Wl,--version-script=$(LIBFDT_version)
> > -Wl,-soname,
> > +SHAREDLIB_LINK_OPTIONS +=-shared
> > +-Wl,--version-script=$(LIBFDT_version) -Wl,-soname,
> >  endif
> >
> >  #
> > @@ -302,7 +307,7 @@ clean: libfdt_clean pylibfdt_clean tests_clean
> >
> >  %.o: %.c
> >  	@$(VECHO) CC $@
> > -	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -c $<
> > +	$(CC) $(CPPFLAGS) $(CFLAGS) $(COMPILE_OPTIONS) -o $@ -c $<
> >
> >  %.o: %.S
> >  	@$(VECHO) AS $@
> > @@ -322,7 +327,7 @@ clean: libfdt_clean pylibfdt_clean tests_clean
> >
> >  %.s:	%.c
> >  	@$(VECHO) CC -S $@
> > -	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -S $<
> > +	$(CC) $(CPPFLAGS) $(CFLAGS) $(COMPILE_OPTIONS) -o $@ -S $<
> >
> >  %.a:
> >  	@$(VECHO) AR $@
> > @@ -330,7 +335,7 @@ clean: libfdt_clean pylibfdt_clean tests_clean
> >
> >  $(LIBFDT_lib):
> >  	@$(VECHO) LD $@
> > -	$(CC) $(LDFLAGS) -fPIC $(SHAREDLIB_LINK_OPTIONS)$(LIBFDT_soname) -o
> $(LIBFDT_lib) $^
> > +	$(CC) $(LDFLAGS) $(SHAREDLIB_LINK_OPTIONS)$(LIBFDT_soname) -o
> > +$(LIBFDT_lib) $^
> >
> >  %.lex.c: %.l
> >  	@$(VECHO) LEX $@
> 
> --
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_
> _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson
